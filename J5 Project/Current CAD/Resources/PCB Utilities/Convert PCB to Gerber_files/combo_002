/*
YUI 3.15.0 (build 834026e)
Copyright 2014 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/

YUI.add("datatype-xml-parse",function(e,t){e.mix(e.namespace("XML"),{parse:function(t){var n=null,r;return typeof t=="string"&&(r=e.config.win,r.ActiveXObject!==undefined?(n=new ActiveXObject("Microsoft.XMLDOM"),n.async=!1,n.loadXML(t)):r.DOMParser!==undefined?n=(new DOMParser).parseFromString(t,"text/xml"):r.Windows!==undefined&&(n=new Windows.Data.Xml.Dom.XmlDocument,n.loadXml(t))),n===null||n.documentElement===null||n.documentElement.nodeName==="parsererror",n}}),e.namespace("Parsers").xml=e.XML.parse,e.namespace("DataType"),e.DataType.XML=e.XML},"3.15.0");
/*
YUI 3.15.0 (build 834026e)
Copyright 2014 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/

YUI.add("io-xdr",function(e,t){function a(e,t,n){var r='<object id="io_swf" type="application/x-shockwave-flash" data="'+e+'" width="0" height="0">'+'<param name="movie" value="'+e+'">'+'<param name="FlashVars" value="yid='+t+"&uid="+n+'">'+'<param name="allowScriptAccess" value="always">'+"</object>",i=s.createElement("div");s.body.appendChild(i),i.innerHTML=r}function f(t,n,r){return n==="flash"&&(t.c.responseText=decodeURI(t.c.responseText)),r==="xml"&&(t.c.responseXML=e.DataType.XML.parse(t.c.responseText)),t}function l(e,t){return e.c.abort(e.id,t)}function c(e){return u?i[e.id]!==4:e.c.isInProgress(e.id)}var n=e.publish("io:xdrReady",{fireOnce:!0}),r={},i={},s=e.config.doc,o=e.config.win,u=o&&o.XDomainRequest;e.mix(e.IO.prototype,{_transport:{},_ieEvt:function(e,t){var n=this,r=e.id,s="timeout";e.c.onprogress=function(){i[r]=3},e.c.onload=function(){i[r]=4,n.xdrResponse("success",e,t)},e.c.onerror=function(){i[r]=4,n.xdrResponse("failure",e,t)},e.c.ontimeout=function(){i[r]=4,n.xdrResponse(s,e,t)},e.c[s]=t[s]||0},xdr:function(t,n,i){var s=this;return i.xdr.use==="flash"?(r[n.id]=i,o.setTimeout(function(){try{n.c.send(t,{id:n.id,uid:n.uid,method:i.method,data:i.data,headers:i.headers})}catch(e){s.xdrResponse("transport error",n,i),delete r[n.id]}},e.io.xdr.delay)):u?(s._ieEvt(n,i),n.c.open(i.method||"GET",t),setTimeout(function(){n.c.send(i.data)},0)):n.c.send(t,n,i),{id:n.id,abort:function(){return n.c?l(n,i):!1},isInProgress:function(){return n.c?c(n.id):!1},io:s}},xdrResponse:function(e,t,n){n=r[t.id]?r[t.id]:n;var s=this,o=u?i:r,a=n.xdr.use,l=n.xdr.dataType;switch(e){case"start":s.start(t,n);break;case"success":s.success(f(t,a,l),n),delete o[t.id];break;case"timeout":case"abort":case"transport error":t.c={status:0,statusText:e};case"failure":s.failure(f(t,a,l),n),delete o[t.id]}},_xdrReady:function(t,r){e.fire(n,t,r)},transport:function(t){t.id==="flash"&&(a(e.UA.ie?t.src+"?d="+(new Date).valueOf().toString():t.src,e.id,t.uid),e.IO.transports.flash=function(){return s.getElementById("io_swf")})}}),e.io.xdrReady=function(t,n){var r=e.io._map[n];e.io.xdr.delay=0,r._xdrReady.apply(r,[t,n])},e.io.xdrResponse=function(t,n,r){var i=e.io._map[n.uid];i.xdrResponse.apply(i,[t,n,r])},e.io.transport=function(t){var n=e.io._map["io:0"]||new e.IO;t.uid=n._uid,n.transport.apply(n,[t])},e.io.xdr={delay:100}},"3.15.0",{requires:["io-base","datatype-xml-parse"]});
/*
YUI 3.15.0 (build 834026e)
Copyright 2014 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/

YUI.add("io-upload-iframe",function(e,t){function u(t,n,r){var i=e.Node.create('<iframe src="#" id="io_iframe'+t.id+'" name="io_iframe'+t.id+'" />');i._node.style.position="absolute",i._node.style.top="-1000px",i._node.style.left="-1000px",e.one("body").appendChild(i),e.on("load",function(){r._uploadComplete(t,n)},"#io_iframe"+t.id)}function a(t){e.Event.purgeElement("#io_iframe"+t,!1),e.one("body").removeChild(e.one("#io_iframe"+t))}var n=e.config.win,r=e.config.doc,i=r.documentMode&&r.documentMode>=8,s=decodeURIComponent,o=e.IO.prototype.end;e.mix(e.IO.prototype,{_addData:function(t,n){e.Lang.isObject(n)&&(n=e.QueryString.stringify(n));var i=[],o=n.split("="),u,a;for(u=0,a=o.length-1;u<a;u++)i[u]=r.createElement("input"),i[u].type="hidden",i[u].name=s(o[u].substring(o[u].lastIndexOf("&")+1)),i[u].value=u+1===a?s(o[u+1]):s(o[u+1].substring(0,o[u+1].lastIndexOf("&"))),t.appendChild(i[u]);return i},_removeData:function(e,t){var n,r;for(n=0,r=t.length;n<r;n++)e.removeChild(t[n])},_setAttrs:function(t,n,r){this._originalFormAttrs={action:t.getAttribute("action"),target:t.getAttribute("target")},t.setAttribute("action",r),t.setAttribute("method","POST"),t.setAttribute("target","io_iframe"+n),t.setAttribute(e.UA.ie&&!i?"encoding":"enctype","multipart/form-data")},_resetAttrs:function(t,n){e.Object.each(n,function(e,n){e?t.setAttribute(n,e):t.removeAttribute(n)})},_startUploadTimeout:function(e,t){var r=this;r._timeout[e.id]=n.setTimeout(function(){e.status=0,e.statusText="timeout",r.complete(e,t),r.end(e,t)},t.timeout)},_clearUploadTimeout:function(e){var t=this;n.clearTimeout(t._timeout[e]),delete t._timeout[e]},_uploadComplete:function(t,r){var i=this,s=e.one("#io_iframe"+t.id).get("contentWindow.document"),o=s.one("body"),u;r.timeout&&i._clearUploadTimeout(t.id);try{o?(u=o.one("pre:first-child"),t.c.responseText=u?u.get("text"):o.get("text")):t.c.responseXML=s._node}catch(f){t.e="upload failure"}i.complete(t,r),i.end(t,r),n.setTimeout(function(){a(t.id)},0)},_upload:function(t,n,i){var s=this,o=typeof i.form.id=="string"?r.getElementById(i.form.id):i.form.id,u;return s._setAttrs(o,t.id,n),i.data&&(u=s._addData(o,i.data)),i.timeout&&s._startUploadTimeout(t,i),o.submit(),s.start(t,i),i.data&&s._removeData(o,u),{id:t.id,abort:function(){t.status=0,t.statusText="abort";if(!e.one("#io_iframe"+t.id))return!1;a(t.id),s.complete(t,i),s.end(t,i)},isInProgress:function(){return e.one("#io_iframe"+t.id)?!0:!1},io:s}},upload:function(e,t,n){return u(e,n,this),this._upload(e,t,n)},end:function(e,t){var n,i;return t&&(n=t.form,n&&n.upload&&(i=this,n=typeof n.id=="string"?r.getElementById(n.id):n.id,n&&i._resetAttrs(n,this._originalFormAttrs))),o.call(this,e,t)}},!0)},"3.15.0",{requires:["io-base","node-base"]});
/*
YUI 3.15.0 (build 834026e)
Copyright 2014 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/

YUI.add("queue-promote",function(e,t){e.mix(e.Queue.prototype,{indexOf:function(t){return e.Array.indexOf(this._q,t)},promote:function(e){var t=this.indexOf(e);t>-1&&this._q.unshift(this._q.splice(t,1)[0])},remove:function(e){var t=this.indexOf(e);t>-1&&this._q.splice(t,1)}})},"3.15.0",{requires:["yui-base"]});
/*
YUI 3.15.0 (build 834026e)
Copyright 2014 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/

YUI.add("io-queue",function(e,t){function r(e,t){return n.queue.apply(n,[e,t])}var n=e.io._map["io:0"]||new e.IO;e.mix(e.IO.prototype,{_q:new e.Queue,_qActiveId:null,_qInit:!1,_qState:1,_qShift:function(){var e=this,t=e._q.next();e._qActiveId=t.id,e._qState=0,e.send(t.uri,t.cfg,t.id)},queue:function(t,n){var r=this,i={uri:t,cfg:n,id:this._id++};return r._qInit||(e.on("io:complete",function(e,t){r._qNext(e)},r),r._qInit=!0),r._q.add(i),r._qState===1&&r._qShift(),i},_qNext:function(e){var t=this;t._qState=1,t._qActiveId===e&&t._q.size()>0&&t._qShift()},qPromote:function(e){this._q.promote(e)},qRemove:function(e){this._q.remove(e)},qEmpty:function(){this._q=new e.Queue},qStart:function(){var e=this;e._qState=1,e._q.size()>0&&e._qShift()},qStop:function(){this._qState=0},qSize:function(){return this._q.size()}},!0),r.start=function(){n.qStart()},r.stop=function(){n.qStop()},r.promote=function(e){n.qPromote(e)},r.remove=function(e){n.qRemove(e)},r.size=function(){n.qSize()},r.empty=function(){n.qEmpty()},e.io.queue=r},"3.15.0",{requires:["io-base","queue-promote"]});
/*
YUI 3.15.0 (build 834026e)
Copyright 2014 Yahoo! Inc. All rights reserved.
Licensed under the BSD License.
http://yuilibrary.com/license/
*/

YUI.add("jsonp-url",function(e,t){var n=e.JSONPRequest,r=e.Object.getValue,i=function(){};e.mix(n.prototype,{_pattern:/\bcallback=(.*?)(?=&|$)/i,_template:"callback={callback}",_defaultCallback:function(t){var n=t.match(this._pattern),s=[],o=0,u,a,f;if(n){u=n[1].replace(/\[(['"])(.*?)\1\]/g,function(e,t,n){return s[o]=n,".@"+o++}).replace(/\[(\d+)\]/g,function(e,t){return s[o]=parseInt(t,10)|0,".@"+o++}).replace(/^\./,"");if(!/[^\w\.\$@]/.test(u)){a=u.split(".");for(o=a.length-1;o>=0;--o)a[o].charAt(0)==="@"&&(a[o]=s[parseInt(a[o].substr(1),10)]);f=r(e.config.win,a)||r(e,a)||r(e,a.slice(1))}}return f||i},_format:function(e,t){var n=/\{callback\}/,r,i;return n.test(e)?e.replace(n,t):(r=this._template.replace(n,t),this._pattern.test(e)?e.replace(this._pattern,r):(i=e.slice(-1),i!=="&"&&i!=="?"&&(e+=e.indexOf("?")>-1?"&":"?"),e+r))}},!0)},"3.15.0",{requires:["jsonp"]});
