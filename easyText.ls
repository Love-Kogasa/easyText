export class easyText
  ( et ) ->
    @list =
      [ ".", "。", ( txt ) -> 
        "#{txt}<br>"
      ],
      [ ";", "；", ( txt ) -> 
        "#{txt}<br><hr>"
      ],
      [ "!", "！", ( txt ) ->
        "<div style='color: yellow;' onclick='alert(\"#txt\")'>#{txt}</div>"
      ],
      [ "~", "～", ( txt ) ->
        "<s>#{txt}</s><br>"
      ],
      [ "@", "→", ( txt ) ->
        "<a href='#{txt}'>Link - 链接</a>"
      ],
      [ "#", "＃", ( txt ) ->
        "<h3>#{txt}</h3><hr>"
      ]
    @code = et
      .split "\n"
  parse : ->
    ret = ""
    list = @list
    @code.forEach ( line ) ->
      list.forEach ( about ) ->
        func = about[ about.length - 1 ]
        theLine = line.trim!
        method = about.slice 0, -1
        ret += if (in method) theLine[ theLine.length - 1] then func theLine.slice( 0, -1 )
          else ""
        null
      null
    ret
  html : ( title = "WebName ～" )->
    "<!doctype>
     <html>
       <head>
         <title>#{title}</title>
         <meta http-equiv='Content-Type' content='charset=utf-8'/>
         <meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1'>
       </head>
       <body>
         #{@parse!}
       </body>
     <html>"
  add : ( func, ...key ) ->
    newAbout = key ++ func
    @list ++= newAbout
    @

export class easyTextParser
  ( element ) ->
    @ele = if typeof element !== "object"
      document.querySelector element
    else
      element
  printTo : ( ele = @ele ) ->
    putTo = if typeof ele !== "object"
      document.querySelector ele
    else
      ele
    putTo.innerHTML = new easyText( @ele.innerHTML ).parse!
    @
  fromURL : ( path, onError ) ->
    if not path then return "path?"
    ele = @ele
    fetch path
      .then ( res ) ->
        res.text()
      .then ( data ) ->
        ele.innerHTML = new easyText( data ).parse!
        null
      .catch ( err ) ->
        if onError then onError err
        else "fetch error"
    @
  fromText : ( text ) ->
    @ele.innerHTML = new easyText( text ).parse!
    @

export class easyTextUtil
  ( data ) ->
    @data = data
  rand : ( max ) ->
    #As randInt
    Math.floor Math.random!*max
  getContent : ( f="(", t=")" ) ->
    #use this method to get some data
    @data.slice do
      @data.lastIndexOf(f)+ 1
      @data.lastIndexOf t

if module then module.exports =
  easyText : easyText
  easyTextParser : easyTextParser
  easyTextUtil : easyTextUtil