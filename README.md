# easyText !!!
**A Hypertext Language Similar to Markdown**
**Use this to write page quickly**
***
A easy example ↓
```
helloWorld;
bro,I Love u.
wow!!
```
As Html
```html
helloWorld<br><hr>
bro,I Love u<br>
<div style='color: yellow;' onclick='alert("wow!")'>wow!</div>
```
It's like as NatureLang
```
this is same as↓.
this is same as↑。
```
u can not only use en symbol in easyText
Cool, right?
***
Oh let's learn how to use easyText<br>
easyText.js have a tool class for u easy to use easyText on web ( don't need node runtime )<br>
I will give u two code version because easyText use LiveScript to make
```js
//example on test2.html
new easyTextParser( "YourElement" ).printTo()
//write easyText code on ur element please
```
Ls version↓
```ls
new easyTextParser "ur element"
  .printTo!
```
**class easyTextParser** have 3 method for easy use
constructor of easyTextParser ::<br>
easyTextParser( ele )<br>
ele can be a string or a object<br>
printTo( outele )<br>
outele default is ele from constructor s arg<br>
fromUrl( url )<br>
use fetch api to read url file and make to ele<br>
fromText( text )<br>
Make easyText code and put to ur element<br>
<br>
In fact, easyTextParser is just a easy tool<br>
If u want better, please use class easyText
***
**class easyText**<br>
constructor( et )<br>
et is the easyText code<br>
parse()<br>
prase easyText to html<br>
html()<br>
prase easyText to html ( all of page )<br>
```js
var et = require( "./easyText" )
console.log( new et.easyText( "helloWorld;\nbro,I Love u.\nwow!!" ).html( "I am title" ) )
```
example on test.js and test.html
```ls
require! "./easyText"
console.log( new easyText.easyText( "
  helloWorld;\n
  bro,I Love u.\n
  wow!!
" ).html( "I am title" ) )
```
example on test.ls<br>
add( func, ...symbol )<br>
the func arg is a function for make newElement
example to add a new easyText symbol
```js
var etp = new easyText( "why?\nno why•" )
etp
  .add( function( txt ){
    return "<p>question : " + txt + " ?</p>"
    //Indenting two squares is a good habit
  }, "?", "？" )
  .add( txt => "• " + txt , "•" )
console.log( etp.parse() )
//<p>question : why ?</p>• no whay
```
ls version
```ls
etp = new easyText "
  why?
  no why•
"

etp
  .add do
    ( txt ) ->
      "<p>question : #txt ?</p>"
    "?"
    "？"
  .add do
    ( txt ) ->
      "• #txt"
    "•"
print = console.log
#www

print etp.parse!
```
how easy it <br>
and Emmm<br>
u can use easyText.list to see the symbol list<br>
All right u can write it too<br>
***
**class easyTextUtil**
constructor( data )<br>
data for then make<br>
getContent( f="(", t=")" )<br>
get f to t 's string<br>
rand( max )<br>
As randInt
***
Thank you vvvvvvvvvvvvvvery much for see finishing it<br>
And welcome make module for easyText<br>
w