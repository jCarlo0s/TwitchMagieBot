;===============================
;            VARIABLES
;By Griever0x for twitch channel
;===============================
%param_len 0
%main_channel #griever0x
%seen_users.1 moobot

;===============================
;            ALIAS
;By Griever0x for twitch channel
;===============================

; User has seen
/uhs {
  var %index = 1
  while ($index <= $len(%seen_users)) {
    if ($2 == %seen_users. [ $+ [ $index ] ]) {
      return 1
    }
    inc %index
  }
  return 0
}

/cmds {
  /msg %main_channel !hola !slap !die !twitter !facebook !loladd
}

/lol {
  /msg %main_channel Para poder jugar con nosotros solo debes dejar tu nombre de invocador usando el comando !loladd nombre_de_invocador. ej. !loladd griever0x


;===============================
;By Griever0x for twitch channel
;===============================

# Comandos de redes sociales
on 1:TEXT:*!twitter*:#:/msg $chan Hey $nick mi twitter es @Griever0x
on 1:TEXT:*!facebook*:#:/msg $chan Hey $nick mi facebook es https://www.facebook.com/griever0x

# Comandos sociales
on 1:TEXT:*!hola*:#:/msg $chan Un $nick salvaje ha aparecido en el directo !!
on 1:TEXT:*!slap*:#:{
  if ($2!=$null) {
    if ($2 ison #griever0x) {
      .msg $chan $nick le da una cachetada a $2
      return 0
      } else {
      .msg $chan ese usuario no esta en el canal
      return 0
    }
    } else {
    .msg $chan !slap funciona cuando especificas el nick de otro usuario
  }
}
on 1:TEXT:*!die*:#:/msg $chan $nick usa embolia cerebral y mata a todos

# Comandos de chistes
# on 1:TEXT:*!chiste*:#:/msg $chan $read(chistes.txt)

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
on 1:TEXT:*!lolinfo*:#:{
  .lol
}

; LOL peticion para agregar
on 1:TEXT:*!loladd*:#:{
  if ($2!=$null) {
    .msg $chan $nick Tu nombre de invocador se guardo correctamente.
    /write lol_add_accounts.txt $2
  }
}
