<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reserve.*" %>
<%@ page import="OtherUser.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
	<title>Reserve</title>
	<meta charset="utf-8">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-wEmeIV1mKuiNpC+IOBjI7aAzPcEZeedi5yW5f2yOq55WWLwNGmvvx4Um1vskeMj0" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="CSS/style_reserve.css">

</head>
<body>
	<% 
	String my_phone_number = "010-6217-9873";
	%>
	<%  // 로그인 페이지에서 넘겨준 userID와 userPassword를 받아서 로그인 판별
		OtherUserDAO otherUserDAO = new OtherUserDAO();
		List<OtherUser> list = otherUserDAO.getAllUsers();
		Reserve reserve = new Reserve(list, my_phone_number);//dummy data
	%>

	<!-- for grey background -->
    <div class="grey_background">empty</div>
    <!-- header -->
    <div class="header">
      <button type="button" name="button" onclick="logout()" class="btn-4 green_button">
        logout
      </button>
      <form method="post" action="mypage.jsp">
      	<input type="text" name="phoneNumber"  value="<%= my_phone_number %>" style="display:none;">
        <button type="submit" name="button" onclick="gotomypage();
       	 " class="btn-4 green_button">my page</button>
      </form>
    </div>

    <!-- tab -->
    <div class="tab">
      <div id="tab_seat" class="tab_seat clicked_tab">
        <h3>Seat</h3>
        <h5><%= reserve.getNumOfSeats() %>/50</h5>
        <div class="empty clicked_tab_box" id="tab_seat_box">empty</div>
      </div>
      <div id="tab_locker" class="tab_locker">
        <h3>Locker</h3>
        <h5><%= reserve.getNumOfLockers() %>/20</h5>
        <div class="empty" id="tab_locker_box">empty</div>
      </div>
    </div>

    <!-- seat content -->
    <div class="seat_content" id="seat_content">
      <div class="seat_content_1">
        <div class="seat_col1">
          <table id="seat1">
          <%
          for(int row_num=0;row_num<5;row_num++){
        	%>
          		<tr>
          	<%
        	  for(int col_num=0;col_num<2;col_num++){
        	  if(reserve.reserveSeats.contains(1+row_num*2+col_num)){
        		  if(reserve.getMyInfo().getSeatId()==1+row_num*2+col_num){
        			  %>
        			  <td class="my" data-key="<%=1+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(1+row_num*2+col_num);%>
		}">
        	 			<%=1+row_num*2+col_num %>
        	 		</td>
        			  <%
        		  }else{
        	 %>
        	 		<td class="occupied" data-key="<%=1+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(1+row_num*2+col_num);%>
		}">
        	 			<%=1+row_num*2+col_num %>
        	 		</td>
        	 <%
        	 }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=1+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(1+row_num*2+col_num);%>
		}">
        	 			<%=1+row_num*2+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
        	%>
        		</tr>
        	<%
    	    }
          %>
          </table>
        </div>
        <div class="seat_col2">
          <table id="seat2">
          	<%
          for(int row_num=0;row_num<5;row_num++){
        	%>
    		  <tr>
    		<%
        	  for(int col_num=0;col_num<2;col_num++){
        	  if(reserve.reserveSeats.contains(11+row_num*2+col_num)){
        		  if(reserve.getMyInfo().getSeatId()==11+row_num*2+col_num){
        	 %>
        			 <td class="my" data-key="<%=11+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(11+row_num*2+col_num);%>
		}">
        	 			<%=11+row_num*2+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=11+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(11+row_num*2+col_num);%>
		}">
        	 			<%=11+row_num*2+col_num %>
        	 		</td>
        	 <%
        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=11+row_num*2+col_num %>"  onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(11+row_num*2+col_num);%>
		}">
        	 			<%=11+row_num*2+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
        	%>
        	  </tr>
        	<%
    	    }
          %>
          </table>
        </div>
        <div class="seat_col3">
          <table id="seat3">
          	<%
          for(int row_num=0;row_num<5;row_num++){
        	 %>
      			<tr>
      		<%
        	  for(int col_num=0;col_num<2;col_num++){
        
        	  if(reserve.reserveSeats.contains(21+row_num*2+col_num)){
        	 if(reserve.getMyInfo().getSeatId()==21+row_num*2+col_num){
        	 %>
        			  <td class="my" data-key="<%=21+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(21+row_num*2+col_num);%>
		}">
        	 			<%=21+row_num*2+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=21+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(21+row_num*2+col_num);%>
		}">
        	 			<%=21+row_num*2+col_num %>
        	 		</td>
        	 <%
        		  }}else{
        		%>
        		   <td class="available" data-key="<%=21+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(21+row_num*2+col_num);%>
		}">
        	 			<%=21+row_num*2+col_num %>
        	 		</td>
        		<%
        	  	}
        
    	      }
      		%>
	  			</tr>
	 	 	<%
    	    }
          %>
          </table>
        </div>
        <div class="seat_col4">
          <table id="seat4">
          	<%
          for(int row_num=0;row_num<5;row_num++){
        	 %>
      			<tr>
      		<%
        	  for(int col_num=0;col_num<2;col_num++){
        
        	  if(reserve.reserveSeats.contains(31+row_num*2+col_num)){
        		  if(reserve.getMyInfo().getSeatId()==31+row_num*2+col_num){
        	        	 %>
        	        			  <td class="my" data-key="<%=31+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(31+row_num*2+col_num);%>
		}"><form method="post" action="loginAction.jsp">
        <button type="submit" class="btn-4" name="button" onclick="gotoreservepage()"><%=31+row_num*2+col_num %></button>
        </form>
        	        	 		</td>
        	        			  <%
        	        			  }
        	        		  else{
        	        	 %>
        	        	 		<td class="occupied" data-key="<%=31+row_num*2+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(31+row_num*2+col_num);%>
		}">
        	        	 			<%=31+row_num*2+col_num %>
        	        	 		</td>
        	        	 <%
        	        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=31+row_num*2+col_num %>">
        	 			<form method="post" action="reserveAction.jsp">
        	<button type="submit" class="btn-4" name="button" onclick="
        	<%
    		request.setAttribute("clicked_seatId",31+row_num*2+col_num);
        	%>"><%=31+row_num*2+col_num %></button>
        </form>
        	 		</td>
        		<%
        	  	}
        
    	      }
      		%>
	  			</tr>
	 	 	<%
    	    }
          %>
          </table>
        </div>
      </div>
      <div class="seat_content_2">
        <div class="door"></div>
        <table id="seat5">
        	<%
          for(int row_num=0;row_num<1;row_num++){
        	 %>
      			<tr>
      		<%
        	  for(int col_num=0;col_num<10;col_num++){
        	  if(reserve.reserveSeats.contains(41+col_num)){
        	 if(reserve.getMyInfo().getSeatId()==41+row_num*2+col_num){
        	 %>
        			  <td class="my" data-key="<%=41+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(41+row_num*2+col_num);%>
		}">
        	 			<%=41+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=41+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(41+row_num*2+col_num);%>
		}">
        	 			
        	 			<%=41+col_num %>
        	 		</td>
        	 <%
        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=41+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachSeat(41+row_num*2+col_num);%>
		}">
        	 			
        	 			<%=41+col_num %>
        	 		</td>
        		<%
        	  	}
        
    	      }
      		%>
	  			</tr>
	 	 	<%
    	    }
          %>
        </table>
      </div>

      <div class="seat_info">
        <div>
          <div></div>
          <span>available</span>
        </div>
        <div>
          <div></div>
          <span>occupied</span>
        </div>
        <div>
          <div></div>
          <span>my seat</span>
        </div>
      </div>
    </div>


    <!-- locker_content -->
    <div class="locker_content" id="locker_content">
      <div class="">
        <table id="locker1">
        	<%
          for(int row_num=0;row_num<4;row_num++){
        	%>
    		  <tr>
    		<%
        	  for(int col_num=0;col_num<5;col_num++){
        	  if(reserve.reserveLockers.contains(1+row_num*5+col_num)){
        		  if(reserve.getMyInfo().getLockerId()==1+row_num*5+col_num){
        	 %>
        			 <td class="my" data-key="<%=1+row_num*5+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachLocker(1+row_num*5+col_num);%>
		}">
        	 			
        	 			<%=1+row_num*5+col_num %>
        	 		</td>
        			  <%
        			  }
        		  else{
        	 %>
        	 		<td class="occupied" data-key="<%=1+row_num*5+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachLocker(1+row_num*5+col_num);%>
		}">
        	 			<%=1+row_num*5+col_num %>
        	 		</td>
        	 <%
        		  }
        	  }else{
        		%>
        		   <td class="available" data-key="<%=1+row_num*5+col_num %>" onclick="function clickEachSeat(){
			<%reserve.clickEachLocker(1+row_num*5+col_num);%>
		}">
        	 			<%=1+row_num*5+col_num %>
        	 		</td>
        		<%
        	  	}
    	      }
        	%>
        	  </tr>
        	<%
    	    }
          %>
        </table>
      </div>

      <div class="locker_info">
        <div>
          <div></div>
          <span>available</span>
        </div>
        <div>
          <div></div>
          <span>occupied</span>
        </div>
        <div>
          <div></div>
          <span>my locker</span>
        </div>
      </div>
    </div>

    <!-- pop up -->
    <div class="reserve_popup_content popup" id="reserve_popup_content">
      <button type="button" class="close_btn close" aria-label="Closename">
        <span aria-hidden="true" class="close_btn">&times;</span>
      </button>
      <span class="reserve_popup_content_title">Reserve 10th seat</span>
      <div class="reserve_popup_grid">
        <button type="button" name="button" onclick="reserve_seat_hours(2); function reserveInDB(){
            <%
            reserve.reserveDAO.reserveSeat(reserve.getMyInfo().getPhoneNumber(),reserve.getMyInfo().getChargedFee(),3000,reserve.clicked_seatId, 2);
            %>
            };">
          <span>2 hours</span>
          <span>3000\</span>
        </button>
        <button type="button" name="button" onclick="reserve_seat_hours(3); function reserveInDB(){
            <%
            reserve.reserveDAO.reserveSeat(reserve.getMyInfo().getPhoneNumber(),reserve.getMyInfo().getChargedFee(),4000,reserve.clicked_seatId, 3);
            %>
            };">
          <span>3 hours</span>
          <span>4000\</span>
        </button>
        <button type="button" name="button" onclick="reserve_seat_hours(4); function reserveInDB(){
            <%
            reserve.reserveDAO.reserveSeat(reserve.getMyInfo().getPhoneNumber(),reserve.getMyInfo().getChargedFee(),5000,reserve.clicked_seatId, 4);
            %>
            };">
          <span>4 hours</span>
          <span>5000\</span>
        </button>
        <button type="button" name="button" onclick="reserve_seat_hours(5); function reserveInDB(){
            <%
            reserve.reserveDAO.reserveSeat(reserve.getMyInfo().getPhoneNumber(),reserve.getMyInfo().getChargedFee(),6000,reserve.clicked_seatId, 5);
            %>
            };">
          <span>5 hours</span>
          <span>6000\</span>
        </button>
      </div>
      <button type="button" class="btn btn-secondary close_btn" id="close_btn"
      style="margin-right: 10px;">
        close
      </button>
    </div>

    <div class="return_popup_content popup" id="return_popup_content">
      <button type="button" class="close_btn close" aria-label="Closename">
        <span aria-hidden="true" class="close_btn">&times;</span>
      </button>
      <span class="return_popup_content_title">Return 10th seat</span>
      <div class="popup_grid">
        <button type="button" class="btn btn-primary return_btn">return</button>
        <button type="button" class="btn btn-secondary close_btn" id="reserve_close_btn">
          close
        </button>
      </div>
    </div>

    <div class="reserve_locker_popup_content popup" id="reserve_locker_popup_content">
      <button type="button" class="close_btn close" aria-label="Closename">
        <span aria-hidden="true" class="close_btn">&times;</span>
      </button>
      <span class="reserve_locker_popup_content_title">Reserve 10th locker</span>
      <div class="popup_grid">
        <button type="button" class="btn btn-primary return_btn">reserve</button>
        <button type="button" class="btn btn-secondary close_btn" id="reserve_close_btn">
          close
        </button>
      </div>
    </div>


    <!-- JS -->
    <script src="JS/index_reserve2.js" type="text/javascript"></script>

</body>
</html>