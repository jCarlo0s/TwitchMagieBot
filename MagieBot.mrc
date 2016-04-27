;===============================
;            GLOBALS
;By Griever0x for twitch channel
;===============================
set %seen_users.1 = $null
set %main_channel = #griever0x

;===============================
;            ALIAS
;By Griever0x for twitch channel
;===============================

; User has seen
alias uhs {
  var %index = 1
  while ($index <= $len(%seen_users)) {
    if ($2 == %seen_users. [ $+ [ $index ] ]) { 
      return 1
    }
    inc %index
  }
  return 0
}

alias cmds {
  msg %main_channel !hola - Comando para saludo
  msg %main_channel !slap nickname - Comando para darle una cachetada a alguien
  msg %main_channel !die - Comando para matar a todos en el canal
  msg %main_channel !twitter - Comando para decirte mi twitter
  msg %main_channel !facebook - Comando para decirte mi facebook
  msg %main_channel ##### Exclusivos para League of Legends ########
  msg %main_channel !loladd - Comando para guardar tu nombre de invocador y podamos agregarte para jugar contigo
}

alias lol{
  msg %main_channel Para poder jugar con nosotros solo debes dejar tu nombre de invocador
  msg %main_channel usando el comando !loladd nombre_de_invocador
  msg %main_channel te estare agregando en la brevedad
}

;===============================
;            REMOTES
;By Griever0x for twitch channel
;===============================

; Comandos de redes sociales
on 1:TEXT:*!twitter*:#:/msg $chan Hey $nick mi twitter es @Griever0x
on 1:TEXT:*!facebook*:#:/msg $chan Hey $nick mi facebook es https://www.facebook.com/griever0x
on 1:TEXT:*!kyo*:#:/msg $chan no olvides visitar nuestro canal amigo http://www.twitch.tv/kyoykimi

; Comandos sociales
on 1:TEXT:*!hi*:#:/msg $chan Un $nick salvaje ha aparecido en el directo !!
on 1:TEXT:*!die*:#:/msg $chan $nick usa embolia cerebral y mata a todos
on 1:TEXT:*!slap*:#:{
  if ($2!=$null) {
    if ($2 ison #griever0x) {
      .msg $chan $nick le da una cachetada a $2
    } else {
      .msg $chan ese usuario no esta en el canal
      return 0
    }
  } else {
    .msg $chan !slap funciona cuando especificas el nick de otro usuario
  }
}

; Comandos de chistes
on 1:TEXT:*!chiste*:#:/msg $chan $read(chistes.txt)

; Saludos al entrar al canal
on 1:JOIN:#griever0x:{
  if ($ush($nick) != 1) {
    %seen_users. [ $+ [$len(%seen_users) + 1] ] = $nick
    .msg $chan $nick Bienvenido al directo, pasala muy bien, no olvides utilizar !commandlist para saber todos los comandos disponibles en el canal.
  }
}

; Help - Lista de comandos
on 1:TEXT:*!commandlist*:#:{
  .cmds
}
on 1:TEXT:*!lol*:#:{
  .lol
}

; LOL peticion para agregar
on 1:TEXT:*!loladd*:#:{
  if ($2!=$null) {
    .msg $chan $nick Tu nombre de invocador se guardo correctamente.
    /write lol_add_accounts.txt $2
  } else {
    .msgn $chan $nick debes agregar tu nombre de invocador al comando ej. !lol Griever0x
  }
}
