---
title: MRBS mit Webunits verknüpfen
tags:
    - til
lang: de
date: 2024-01-18
---

[MRBS](https://github.com/meeting-room-booking-system/mrbs-code) ist ein Raumbuchungssystem. Dieses System bietet mehr Möglichkeiten Räume bzw. Gruppen zu verwalten, als die hauseigenen Mittel von WebUnits. 

Doch ein weiteres System in der Schule bringt immer Hürde mit sich, daher sollte die Nutzung des Systems möglichst niederschwellig sein. Das heißt unter anderem, dass kein neuer Account notwendig sein sollte.

MRBS bringt verschiedene Authentifizierungsmöglichkeiten mit. Die wohl spannendes ist die IMAP-Authentifizierung. So kann MRBS mit der bestehenden Schul-E-Mail-Accounts verknüpft werden.

Doch die Schul-E-Mail wird langsam durch den WebUnits Messenger abgelöst, sodass das Passwort wahrscheinlich nicht mehr bei vielen Schüler\:innen präsent ist.

Glücklicherweise ist es relativ leicht ein neues Authentifizierungssystem zu einzubinden. Dazu bedarf es lediglich der Programmierung einer Datei `AuthWebUntis` im Verzeichnis `web/lib/MRBS/Auth`.

Hier ist das Ergebnis, welches mithilfe der [JSON-RPC Dokumentation von WebUnits](https://untis-sr.ch/telechargements/) entwickelt wurde:

```php
<?php
namespace MRBS\Auth;
    
use MRBS\User;
    
// A class for authenticating against a WebUnits system.  
class AuthWebUntis extends Auth
{     
  public function validateUser(
    #[\SensitiveParameter]
    ?string $user,
    #[\SensitiveParameter]
    ?string $pass)
  { 
    global $auth;
    
    if (!isset($user) || !isset($pass))
    {
      return false;
    }
  
    $params = array(
      'user' => $user,
      'password' => $pass,
      'client' => $auth['web_untis']['client']
    );
    
    $result = $this->jsonrpc_functions('authenticate', $params);

    if ($result === false)
 {
      // curl_exec failure: we'll return false anyway
      return $result;
    }

    return (json_decode($result)) ? $user : false;
  }


  // Checks whether validation of a user by email address is possible and allowed.
  public function canValidateByEmail() : bool
  {
    return false;
  }


  // Checks whether validation of a user by username is possible and allowed.
  public function canValidateByUsername() : bool
  {
    return true;
  }

  private function jsonrpc_functions(string $function, array $params)
  {
    global $auth, $server;

    // Add a trailing '/' if necessary
    if (!str_ends_with($auth['web_untis']['base_url'], '/'))
    {
      $auth['web_untis']['base_url'] .= '/';
    }

    // Get a user agent to keep the other end happy
    if (isset($server['HTTP_USER_AGENT']) && ($server['HTTP_USER_AGENT'] !== ''))
    {
      $user_agent = $server['HTTP_USER_AGENT'];
    }
    else
    {
      $user_agent = 'PHP';
 }

    $url = $auth['web_untis']['base_url'] . "WebUntis/jsonrpc.do?school=" . urlencode($auth['web_untis']['school']);
    self::debug("URL=\"$url\"");

    $ch = curl_init();
    curl_setopt($ch, CURLOPT_URL, $url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    // Necessary to prevent "HTTP/2 stream 0 was not closed cleanly: INTERNAL_ERROR (err 2)" error;
    curl_setopt($ch, CURLOPT_HTTP_VERSION, CURL_HTTP_VERSION_1_1);
    // Necessary to prevent "OpenSSL SSL_read: Connection reset by peer, errno 104" error;
    curl_setopt($ch, CURLOPT_USERAGENT, $user_agent);
    curl_setopt($ch, CURLOPT_HTTPHEADER, array(
        'Content-Type: application/json'
    ));
    curl_setopt($ch, CURLOPT_POST, true);
    $data['id'] = "ID";
    $data['params'] = $params;
    $data['method'] = $function;
    $data['jsonrpc'] = "2.0";

    self::debug("CURL_DATA=\"" . json_encode($data) . "\"");

    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));
    // Use compression if we can
    if (defined('CURLOPT_ENCODING'))
    {
      curl_setopt($ch, CURLOPT_ENCODING, '');
    }
    // Get some debug info in case there's an error
    curl_setopt($ch, CURLOPT_VERBOSE, true);
    $stream = fopen('php://temp', 'w+');
    curl_setopt($ch, CURLOPT_STDERR, $stream);

    $result = curl_exec($ch);
    $http_code = curl_getinfo($ch, CURLINFO_HTTP_CODE);
    if ($result === false)
    {
      rewind($stream);
      $message = curl_error($ch);
      $message .= "\n\nCurl verbose log:\n\n" . stream_get_contents($stream);
      self::debug("CURL=\"$message\"");
      trigger_error($message, E_USER_WARNING);
    }
    elseif ($http_code != 200)
    {
      trigger_error("Curl received HTTP response code $http_code: $result", E_USER_WARNING);
      $result = false;
    }

    $data = json_decode($result, true);
    if($data["error"]) {
        self::debug("CURL=\"Error\"");
        return false;
    }
    self::debug("CURL_RESULT=\" . $result . \"");

    fclose($stream);
    curl_close($ch);
    return $result;
  }


  private static function debug(string $message) : void
  {
    global $auth;

    if ($auth['web_untis']['debug'])
    {
      self::logDebugMessage($message);
    }
  }
}
```

Jetzt kann man die neue Authentifizierungsmethode in der `config.inc.php` konfigurieren.

```php
//...
$auth["type"] = "web_untis"
$auth["web_untis"]["client"] = "MRBS";
$auth["web_untis"]["school"] = "SCHULNAME";
$auth["web_untis"]["base_url"] = "https://SERVER";
$auth["web_untis"]["debug"] = true;
//...
```

Voila! Fertig ist die Integration von WebUnits.