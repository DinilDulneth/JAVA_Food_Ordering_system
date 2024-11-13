<%@ page import="com.user.MsgSeller" %>
<%@ page import="com.user.userDBUtil" %>
<%@ page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <title>Admin ChatBox</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #F5F5DC;
            background-size: cover;
            margin: 0;
            padding: 0;
            background-image: url('img/backgroundPH.jpg');
        }

        .chat-container {
            width: 60%;
            margin: 20px auto;
            background-color: #FFFCEF;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .chat-header {
            background-color: #EF4C44;
            padding: 5px; 
            color: white;
            text-align: center;
            font-size: 17px; 
        }

        .chat-box {
            padding: 15px;
            height: 380px;
            overflow-y: scroll;
            background-color: #F5F5DC;
            /* background-image: url('img/backgroundPH.jpg'); */
        }

        .message {
            margin-bottom: 15px;
            padding: 10px 20px;
            border-radius: 10px;
            font-size: 16px;
            max-width: 70%;
            word-wrap: break-word;
        }

        .admin-message {
            background-color:rgb(50,50,50);
            color: white;
            text-align: left;
            margin-right: auto;
        }

        .seller-message {
            background-color: #F1CF54;
            color: #000000;
            text-align: right;
            margin-left: auto;
        }

        .message-details {
            font-size: 12px;
            color: #555;
            text-align: right;
        }

        .chat-footer {
		    background-color: #F1CF54;
		    padding: 10px;
		    display: flex;
		    justify-content: space-between;
		    align-items: center;
		    flex-direction: row; 
		}
		
		.chat-footer input[type="text"] {
		    flex-grow: 1;
		    padding: 10px;
		    border: none;
		    border-radius: 50px;
		    font-size: 16px;
		    margin-right: 10px; 
		    width:400px;
		}

        .header-icons {
            display: flex; 
            justify-content: space-around;
            align-items: center;
            background-color: rgb(72,72,72); 
            height: 40px; 
            border-radius: 30px;  
            padding: 0 20px;  
            box-shadow: 0px 2px 10px;  
            margin-bottom: 10px;
            width: 75%;
            margin: 10px auto;
        }

        .header-icons a {
            color: #FFFCEF;  
            text-decoration: none;  
            transition: color 0.3s;  
            display: flex;  
            align-items: center;  
            flex-direction: column;  
        }

        .header-icons a:hover {
            color: #E54C44;
        }

        .back-button {
            color: #FFFCEF;
            text-decoration: none;
            display: flex; 
            align-items: center;
        }

        .back-button:hover {
            color: #E54C44;
        }
        .buttonsend {
		    background-color: #EF4C44;
		    color: white;
		    border: none;
		    padding: 10px; 
		    border-radius: 50px;
		    cursor: pointer;
		    display: flex;
		    align-items: center;
		    transition: 0.7s;
		}
		
		.buttonsend:hover {
		    background-color: white;
		    color: #EF4C44;
		    cursor: pointer;
		}
		.alignfff{
			display:flex;
			flex-direction: row;  
		}
    </style>
</head>
<body>

    <div class="header-icons">
        <a class="back-button" href="javascript:void(0);" onclick="window.history.back();">
		    <i class="fas fa-arrow-left" style="font-size: 20px;"></i>
		</a>

        <a href="AdminDashboard.jsp">
            <i class="fas fa-tachometer-alt" style="font-size: 20px;"></i>
        </a>
        <a href="homePage.jsp">
            <i class="fas fa-home" style="font-size: 20px;"></i>
        </a>
        <a href="sellerProfiles.jsp" title="Go to User Profiles">
            <i class="fas fa-users" style="font-size: 20px;"></i> 
        </a>
    </div>

    <div class="chat-container">
        <div class="chat-header">
            Chat with Seller ID: <%= request.getParameter("sellerID") %> 
        </div>
        <div class="chat-box">
            <% 
                List<MsgSeller> adminMsg = userDBUtil.getMsg(request.getParameter("sellerID"));
                for (MsgSeller mm : adminMsg) { 
                    if(mm.getSid() == 0) {
            %>
                        <div class="message admin-message">
                            <%= mm.getMassage() %>
                            <div class="message-details">
                                <%= mm.getDate() %> - <%= mm.getTime() %>
                            </div>
                        </div>
            <% 
                    } else {
            %>
                        <div class="message seller-message">
                            <%= mm.getMassage() %>
                            <div class="message-details">
                                <%= mm.getDate() %> - <%= mm.getTime() %>
                            </div>
                        </div>
            <% 
                    }
                } 
            %>
        </div>

        <div class="chat-footer">
            <form action="adminSend" method="POST">
                <input type="hidden" name="sellerID" value="<%= request.getParameter("sellerID") %>" readonly>
                <div class="alignfff">
                	<input type="text" name="massage" placeholder="Type a message..." required>
                
	                <button type="submit" name="submitamsg" class="buttonsend">
			            <i class="fas fa-paper-plane" style="font-size: 18px; margin-right: 5px;"></i>
			        </button>
                </div>
                
            
            </form>
        </div>
    </div>

</body>
</html>
