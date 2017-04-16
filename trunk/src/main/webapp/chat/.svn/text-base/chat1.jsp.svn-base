<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
    <title>Cometd chat</title>
    <style>
  

input {
    margin: 0;
}

table td {
    padding: 0.2em;
}

#chatroom {
    border: 1px solid black;
    background-color: #ffffff;
}

#chat {
    float: left;
    width: 38em;
    height: 16em;
    overflow: auto;
    background-color: #f0f0f0;
    padding: 0.2em;
    border-right: 1px solid black;
}

#members {
    float: left;
    clear: right;
    overflow: auto;
    padding: 0.2em;
}

#input {
    clear: both;
    padding: 0.2em;
    border-top: 1px solid black;
    background-color: #efebe7;
}

#phrase {
    width: 28em;
}

#altServer {
    width: 20em;
}

#username {
    width: 20em;
}

.hidden {
  display: none;
}

span.from {
    font-weight: bold;
}

span.membership {
    font-style: italic;
}
    
    </style>
    
     <style type="text/css">
      @import "dojox/widget/Calendar/Calendar.css"; @import "dijit/themes/tundra/tundra.css";
      @import "dojo/dijit/themes/nihilo/nihilo.css";      
      @import"dojo/resources/dojo.css" @import "dojox/layout/resources/FloatingPane.css"
      @import "chat/chat.css"  @import "dojox/layout/resources/ResizeHandle.css";
    </style>
    
    <script type="text/javascript" src="../dojo/dojo.js" djConfig="parseOnLoad:true">
    </script>
    <script type="text/javascript">
        var config = {
            contextPath: '<%=request.getContextPath()%>'
        };

        dojo.require("dojox.cometd");
        dojo.require("dojox.cometd.timestamp");
        dojo.require("dojox.cometd.ack");
        dojo.require("dojo.dnd.Source");
        dojo.require("dojo.dnd.Container");
        dojo.require("dojox.layout.FloatingPane");
        dojo.require("dojo.dnd.Manager");
        dojo.require("dojo.dnd.Avatar");
        dojo.require("dojo.dnd.Selector");
        dojo.require("dijit.layout.ContentPane");
        dojo.require("dijit.layout.TabContainer");
        dojo.require("dijit.Dialog");
        dojo.require("dijit.form.TextBox");
        dojo.require("dojox.validate.regexp");
        dojo.require("dijit.form.ValidationTextBox")
        dojo.require("dijit.Tooltip");
        dojo.require("dijit.form.Form");
        dojo.require("dijit.form.CheckBox");
        dojo.require("dijit.layout.AccordionContainer");
        dojo.require("dijit.Menu");
        dojo.require("dijit.PopupMenuItem");
        dojo.require("dojox.layout.FloatingPane");
        dojo.require("dijit.layout.BorderContainer");
        dojo.require("dijit.layout.StackContainer");
        dojo.require("dijit.Dialog");
        dojo.require("dijit.Editor");
        dojo.require("dojox.layout.FloatingPane");
        dojo.require("dijit.form.RadioButton");
      	dojo.require("dijit._editor.plugins.AlwaysShowToolbar");
       	dojo.require("dijit._editor.plugins.EnterKeyHandling");
        	dojo.require("dijit._editor.plugins.LinkDialog");
          

        var room = {
            _lastUser: null,
            _username1: null,
            _connected: false,
            _disconnecting: false,
            _chatSubscription: null,
            _membersSubscription: null,

            _init: function()
            {
                dojo.removeClass("join", "hidden");
                dojo.addClass("joined", "hidden");

                               

                dojo.query("#username1").attr({
                    "autocomplete": "off"
                }).onkeyup(function(e)
                {
                    if (e.keyCode == dojo.keys.ENTER)
                    {
                        room.join(dojo.byId('username1').value);
                    }
                });

                dojo.query("#joinButton").onclick(function(e)
                {
                    room.join(dojo.byId('username1').value);
                });

                dojo.query("#phrase").attr({
                    "autocomplete": "off"
                }).onkeyup(function(e)
                {
                    if (e.keyCode == dojo.keys.ENTER)
                    {
                        room.chat();
                    }
                });

                dojo.query("#sendButton").onclick(function(e)
                {
                    room.chat();
                });

                dojo.query("#leaveButton").onclick(room, "leave");
            },

            join: function(name)
            {
                room._disconnecting = false;

                if (name == null || name.length == 0)
                {
                    alert('Please enter a username1');
                    return;
                }

                dojox.cometd.ackEnabled = dojo.query("#ackEnabled").attr("checked");

                var cometdURL = location.protocol + "//" + location.host + config.contextPath + "/cometd";
                dojox.cometd.init({
                    url: cometdURL,
                    logLevel: "debug"
                });

                room._username1 = name;

                dojo.addClass("join", "hidden");
                dojo.removeClass("joined", "hidden");
                dojo.byId("phrase").focus();
            },

            _unsubscribe: function()
            {

            },

            _subscribe: function()
            {
                room._chatSubscription = dojox.cometd.subscribe('/chat/demo', room.receive);
                room._membersSubscription = dojox.cometd.subscribe('/chat/members', room.members);
            },

            leave: function()
            {
                dojox.cometd.startBatch();
                dojox.cometd.publish("/chat/demo", {
                    user: room._username1,
                    chat: room._username1 + " has left"
                });
                room._unsubscribe();
                dojox.cometd.disconnect();
                dojox.cometd.endBatch();

                // switch the input form
                dojo.removeClass("join", "hidden");
                dojo.addClass("joined", "hidden");

                dojo.byId("username1").focus();
                dojo.byId('members').innerHTML = "";

                room._username1 = null;
                room._lastUser = null;
                room._disconnecting = true;
            },

            chat: function()
            {
                var text = dojo.byId('phrase').value;
                dojo.byId('phrase').value = '';
                if (!text || !text.length) return;

                var colons = text.indexOf("::");
                if (colons > 0)
                {
                    dojox.cometd.publish("/service/privatechat", {
                        room: "/chat/demo", // This should be replaced by the room name
                        user: room._username1,
                        chat: text.substring(colons + 2),
                        peer: text.substring(0, colons)
                    });
                }
                else
                {
                    dojox.cometd.publish("/chat/demo", {
                        user: room._username1,
                        chat: text
                    });
                }
            },

            receive: function(message)
            {
                var fromUser = message.data.user;
                var membership = message.data.join || message.data.leave;
                var text = message.data.chat;

                if (!membership && fromUser == room._lastUser)
                {
                    fromUser = "...";
                }
                else
                {
                    room._lastUser = fromUser;
                    fromUser += ":";
                }

                var chat = dojo.byId('chat');
                if (membership)
                {
                    chat.innerHTML += "<span class=\"membership\"><span class=\"from\">" + fromUser + "&nbsp;</span><span class=\"text\">" + text + "</span></span><br/>";
                    room._lastUser = null;
                }
                else if (message.data.scope == "private")
                {
                    chat.innerHTML += "<span class=\"private\"><span class=\"from\">" + fromUser + "&nbsp;</span><span class=\"text\">[private]&nbsp;" + text + "</span></span><br/>";
                }
                else
                {
                    chat.innerHTML += "<span class=\"from\">" + fromUser + "&nbsp;</span><span class=\"text\">" + text + "</span><br/>";
                }

                chat.scrollTop = chat.scrollHeight - chat.clientHeight;
            },

            members: function(message)
            {
                

            	var node = dojo.byId('members');
            	node.innerHTML = ""; 
                for (var i in message.data) {               

                     
                      //var node = dojo.doc.createElement("div");
               		 // node.id = dojo.dnd.getUniqueId();
               		

               		 var n = dojo
               				.create(
               						"div",
               						{
               							innerHTML : message.data[i]
               						});
               		node.appendChild(n);
               		 var rightClickMenu = dijit.byId("tree_menu1");
               	     // when we right-click anywhere on the tree, make sure we open the menu
               		 rightClickMenu.bindDomNode(node);
               		        
               		 dojo.connect(rightClickMenu, "_openMyself", node, function(e){
               		      // get a hold of, and log out, the tree node that was the source of this open event		      
               		     setNode(node);		      		    });
                        }

               
               
            },

            _connectionEstablished: function()
            {
                room.receive({
                    data: {
                        user: 'system',
                        chat: 'Connection to Server Opened'
                    }
                });
                dojox.cometd.startBatch();
                room._unsubscribe();
                room._subscribe();
                dojox.cometd.publish('/service/members', {
                    user: room._username1,
                    room: '/chat/demo'
                });
                dojox.cometd.publish('/chat/demo', {
                    user: room._username1,
                    membership: 'join',
                    chat: room._username1 + ' has joined'
                });
                dojox.cometd.endBatch();
            },

            _connectionBroken: function()
            {
                room.receive({
                    data: {
                        user: 'system',
                        chat: 'Connection to Server Broken'
                    }
                });
                dojo.byId('members').innerHTML = "";
            },

            _connectionClosed: function()
            {
                room.receive({
                    data: {
                        user: 'system',
                        chat: 'Connection to Server Closed'
                    }
                });
            },

            _metaConnect: function(message)
            {
                if (room._disconnecting)
                {
                    room._connected = false;
                    room._connectionClosed();
                }
                else
                {
                    var wasConnected = room._connected;
                    room._connected = message.successful === true;
                    if (!wasConnected && room._connected)
                    {
                        room._connectionEstablished();
                    }
                    else if (wasConnected && !room._connected)
                    {
                        room._connectionBroken();
                    }
                }
            }
        };

        dojox.cometd.addListener("/meta/connect", room, room._metaConnect);
        dojo.addOnLoad(room, "_init");
        dojo.addOnUnload(room, "leave");        

        var clickedMember = null; 
        function setNode(node) {
             clickedMember = node;
          
        }

        function privateChat() {

        	var floatingPane = 
    			createFloatingPane("map_container", "Map", 10, 10, 400, 500);
                
        }

        function createFloatingPane(divId, title, x, y, width, height) {
        	var pane = new dojox.layout.FloatingPane({  
        		'title': title,
        		'id': divId + "_floater",
        		'closeable': true,
        		'resizable': true,
        		'dockable': false
        	}, divId);
        	
        	// quick fix for positioning, does not seem necessary in source code
        	// example (FloatingPane test), but was necessary with dojo bin and
        	// Firefox 3.0.1
        	pane.domNode.style.left = x + "px";
        	pane.domNode.style.top = y + "px";
        	pane.resize({ 'w': width, 'h': height });
        	
        	pane.startup(); 
        	
        	return pane;
        }
                
        
    </script>
</head>

<body>

<h1>Conference</h1>


<div id="chatroom" >
    <div id="chat"></div>
    <div id="members" ></div>
    <div id="input">
        <div id="join">
            <table>
                <tbody>
                <tr>
                    <td>
                        
                    </td>
                    <td>
                        
                    </td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        Enter  Nickname
                    </td>
                    <td>
                        <input id="username1" type="text" />
                    </td>
                    <td>
                        <button id="joinButton" class="button">Join</button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
        <div id="joined">
            Chat:
            &nbsp;
            <input id="phrase" type="text" />
            <button id="sendButton" class="button">Send</button>
            <button id="leaveButton" class="button">Leave</button>
        </div>
    </div>
</div>
<br />
<div id="map_container">
<div id="map" style="width:100%;height:100%;"></div>
</div>

<div style="padding: 0.25em;">Tip 1: Use username[,username2]::text to send private messages</div>
<div style="padding: 0.25em;">Tip 2: Use webcam::yes to enable webcam </div>
<div style="padding: 0.25em;">Tip 3: Use voice::yes to enable voice </div>
<div style="padding: 0.25em;">Tip 4: Drag and Drop job here for instant discussion </div>


<!--  Right click Menu Items for chat with members -->
<ul dojoType="dijit.Menu" id="tree_menu1" style="display: none;">
  <li dojoType="dijit.MenuItem" onClick= "privateChat()" >
  Private Chat
</li>
<li dojoType="dijit.MenuItem" disabled="true">
Expert Learn
</li>
<li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconCopy" onClick= "myId('connect_to_recruiter')" >
Connect To Recruiter
</li>
<li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconCopy" onClick= "myId('discuss')" >
Discuss
</li>
<li dojoType="dijit.MenuItem" iconClass="dijitEditorIcon dijitEditorIconPaste" onClick= "myId('training')" >
Training
</li>
<li dojoType="dijit.PopupMenuItem">
<span>
  Resume
</span>
<ul dojoType="dijit.Menu" id="submenu22">
  <li dojoType="dijit.MenuItem" onClick= "myId('apply_directly')">
  Apply Directly
</li>
<li dojoType="dijit.MenuItem" onClick= "myId('match')">
Match
</li>
<li dojoType="dijit.PopupMenuItem" >
<span>
  KeyWord Match
</span>
<ul dojoType="dijit.Menu" id="submenu42">
  <li dojoType="dijit.MenuItem" onClick= "myId('all_keywords')" >
  All Keywords
</li>
<li dojoType="dijit.MenuItem" onClick= "myId('specific_keywords')" >
Specific KeyWords
</li>
</ul>
</li>
</ul>
</li>
<li dojoType="dijit.PopupMenuItem">
<span>
  I am Employer
</span>
<ul dojoType="dijit.Menu" id="submenu32" style="display: none;">
  <li dojoType="dijit.MenuItem" disabled="true" onClick= "myId('download_resumes')" >
  Download Resumes
</li>
<li dojoType="dijit.MenuItem" disabled="true" onClick="myId('connect_to_candidates')" >
Connect to Candidates
</li>
<li dojoType="dijit.MenuItem" disabled="true" onClick= "myId('virtual_interview')" >
Virtual Interview
</li>
</ul>
</li>
</ul>

<!-- End of Right click Menu Items -->


</body>

</html>
