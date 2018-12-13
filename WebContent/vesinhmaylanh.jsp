<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file= "HeaderNguoidung.jsp"%>

<div class="main-banner">
    <div class="banner-holder">
      <div class="gradient-layer-box"></div>
      <img src="./images/vesinhmaylanh/service1.jpg" alt="">
      <div class="text-in-banner">
        <h1>Vệ sinh máy lạnh</h1>
        <br>
        <%
    	if("3".equalsIgnoreCase(maquyen)){
   		 %>
	    	<a href="javascript:;" class="btn-normal scroll-download dangkydichvu-modal" data-popup-open="popup-1"
			style="text-decoration: none;">Đăng ký dịch vụ</a>
		<%}else
		{
		%>
			<a href="StartServlet" class="btn-normal scroll-download" style="text-decoration: none;"> Đăng nhập để đăng ký</a>
		<%}%>
      </div>
    </div>
  </div>

  <div class="container">
    <!-- Interest DaNaLiKinh -->
    <div class="section-space">
      <div class="DaNaLiKinh-interest DaNaLiKinh-interest-about text-center">
        <h2 class="heading2 max-width">Tại sao nên dùng dịch vụ vệ sinh máy lạnh của DaNaLiKinh ?</h2>
        <div class="row">
          <div class="col-sm-4 col-md-4">
            <div class="interest-wrapper become-tk-interest text-center DaNaLiKinh-interest-Height item-Heigth324">
              <img src="./images/vesinhmaylanh/sky-gun.svg" alt="">
              <h3>Nhanh chóng – Tiện lợi</h3>
              <p>Với 60 giây thao tác trên ứng dụng, bạn sẽ có ngay nhân viên đến làm việc.</p>
            </div>
          </div>
          <div class="col-sm-4 col-md-4">
            <div class="interest-wrapper become-tk-interest text-center DaNaLiKinh-interest-Height item-Heigth324">
              <img src="./images/vesinhmaylanh/money.svg" alt="">
              <h3>Giá cả rõ ràng</h3>
              <p>Giá được hiển thị rõ ràng trên ứng dụng lúc đăng việc và chỉ cần thanh toán đúng số tiền đó.</p>
            </div>
          </div>
          <div class="col-sm-4 col-md-4">
            <div class="interest-wrapper become-tk-interest text-center DaNaLiKinh-interest-Height item-Heigth324">
              <img src="./images/vesinhmaylanh/thumb.png" alt="">
              <h3>Dịch vụ chất lượng</h3>
              <p>Các đối tác của DaNaLiKinh đều lành nghề và thường xuyên được hệ thống đánh giá chất lượng.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- Interest DaNaLiKinh -->
  </div>
  <div id="contentContainer"></div>

  <!--Table price  -->
  <div class="table-service-price section-space">
    <div class="container">
      <h2 class="heading2 text-center white-text">Bảng giá tham khảo</h2>
      <div class="table-responsive">
        <table class="table table-price">
          <thead>
            <tr>
              
                <th>Loại</th>
              
                <th>Công việc</th>
              
                <th>Công suất</th>
              
                <th>Giá</th>
              
            </tr>
          </thead>
          <tbody>
            <tr>
              <td data-text="Loại">Máy lạnh treo tường</td>
              <td data-text="Công việc">Vệ sinh/ Bơm gas</td>
              <td data-text="Công suất">Từ 2 trở xuống
                <br>Lớn hơn 2</td>
              <td data-text="Giá">120,000 VND
                <br>120,000 VND</td>
            </tr>
            <tr>
              <td data-text="Loại">Máy lạnh tủ đứng</td>
              <td data-text="Công việc">Vệ sinh/ Bơm gas</td>
              <td data-text="Công suất">-</td>
              <td data-text="Giá">200,000 VND</td>
            </tr>
            <tr>
              <td data-text="Loại">Máy lạnh âm trần</td>
              <td data-text="Công việc">Vệ sinh/ Bơm gas</td>
              <td data-text="Công suất">Từ 3 trở xuống
                <br>Lớn hơn 3</td>
              <td data-text="Giá">150,000 VND
                <br>200,000 VND</td>
            </tr>
          </tbody>
        </table>
      </div>
      <div class="text-center">
        <%
    	if("3".equalsIgnoreCase(maquyen)){
   		 %>
	    	<a href="javascript:;" class="btn-normal scroll-download dangkydichvu-modal" data-popup-open="popup-1"
			style="text-decoration: none;">Đăng ký dịch vụ</a>
		<%}else
		{
		%>
			<a href="StartServlet" class="btn-normal scroll-download" style="text-decoration: none;"> Đăng nhập để đăng ký</a>
		<%}%>
      </div>
    </div>
  </div>

  <!--Protection steps  -->
  <div class="protection-steps section-space">
    <div class="container">
      <h2 class="heading2 text-center">Quy trình các bước vệ sinh máy lạnh chuẩn</h2>
      <h3 class="text-center heading3">
        
          <p class="font-size-16">Các đối tác của DaNaLiKinh sẽ thực hiện việc vệ sinh máy lạnh theo quy trình dưới đây.</p>
        
          <p class="font-size-16">Nếu có nhu cầu vệ sinh khác, khách hàng vui lòng ghi chú cụ thể trong lúc đăng việc.</p>
        
      </h3>
      <br>
      <ul id="collapseTabMob" class="list-steps-protection text-center hidden-xs">
        <li class="active item-Height110">
          <a href="#box1" data-toggle="tab">
            <span id="checking-hover">
              <img src="./images/vesinhmaylanh/remote-control.svg" alt="" class="svg svg-image">
            </span>
            <p class="gen-text">Bật và kiểm tra máy trước khi vệ sinh</p>
          </a>
        </li>
        <li class="item-Height110">
          <a href="#box2" data-toggle="tab">
            <span id="cleaning-hover">
              <img src="./images/vesinhmaylanh/vesinhboloc.svg" alt="" class="svg svg-image">
            </span>
            <p class="gen-text">Vệ sinh bộ lọc</p>
          </a>
        </li>
        <li class="item-Height110">
          <a href="#box3" data-toggle="tab">
            <span id="cold-hover">
              <img src="./images/vesinhmaylanh/vesinhgianlanh.svg" alt="" class="svg svg-image">
            </span>
            <p class="gen-text">Vệ sinh giàn lạnh</p>
          </a>
        </li>
        <li class="item-Height110">
          <a href="#box4" data-toggle="tab">
            <span id="hot-hover">
              <img src="./images/vesinhmaylanh/vesinhgiannong.svg" alt="" class="svg svg-image">
            </span>
            <p class="gen-text">Vệ sinh giàn nóng</p>
          </a>
        </li>
        <li class="item-Height110">
          <a href="#box5" data-toggle="tab">
            <span id="ac-hover">
              <img src="./images/vesinhmaylanh/air-conditioner.svg" alt="" class="svg svg-image">
            </span>
            <p class="gen-text">Lắp lại và kiểm tra</p>
          </a>
        </li>
        <li class="item-Height110">
          <a href="#box6" data-toggle="tab">
            <span id="gas-hover">
              <img src="./images/vesinhmaylanh/gas.svg" alt="" class="svg svg-image">
            </span>
            <p class="gen-text">Bơm ga máy lạnh</p>
          </a>
        </li>
      </ul><div class="panel-group visible-xs" id="collapseTabMob-accordion"></div>

      <div class="protection-steps-box-holder hidden-xs">
        <div class="tab-content">
          <div id="box1" class="tab-pane fade in active">
            
              <p class="protection-content">Để máy lạnh hoạt động và kiểm tra tình trạng của máy để có cách vệ sinh đúng nhất, bao gồm: mùi, mức độ làm lạnh, quạt gió…</p>
            
          </div>
          <div id="box2" class="tab-pane fade in">
            <div class="row largepadding-row">
              <div class="col-md-6 col-sm-6 border-right item-Height70">
                
                  <p class="protection-content">- Ngắt điện máy lạnh</p>
                
                  <p class="protection-content">- Tháo phần vỏ nhựa bên ngoài</p>
                
              </div>
              <div class="col-md-6 col-sm-6 item-Height70">
                
                  <p class="protection-content">- Tháo các tấm lọc bụi ra khỏi giàn lạnh</p>
                
                  <p class="protection-content">- Rửa sạch tấm lọc</p>
                
              </div>
            </div>
          </div>
          <div id="box3" class="tab-pane fade in">
            <div class="row largepadding-row">
              <div class="col-md-6 col-sm-6 border-right item-Height70">
                
                  <p class="protection-content">- Dùng giẻ hoặc túi nilon che kín phần bo mạch</p>
                
                  <p class="protection-content">- Treo cố định túi nilon hoặc bạt để hứng nước</p>
                
              </div>
              <div class="col-md-6 col-sm-6 item-Height70">
                
                  <p class="protection-content">- Xịt nước làm sạch giàn lạnh</p>
                
              </div>
            </div>
          </div>
          <div id="box4" class="tab-pane fade in">
            <div class="row largepadding-row">
              <div class="col-md-6 col-sm-6 border-right item-Height35">
                
                  <p class="protection-content">- Kiểm tra lại đảm bảo đã ngắt điện hoàn toàn</p>
                
              </div>
              <div class="col-md-6 col-sm-6 item-Height35">
                
                  <p class="protection-content">- Dùng vòi nước xịt vệ sinh giàn nóng</p>
                
              </div>
            </div>
          </div>
          <div id="box5" class="tab-pane fade in">
            <div class="row largepadding-row">
              <div class="col-md-6 col-sm-6 border-right item-Height70">
                
                  <p class="protection-content">- Lau khô các các phần lưới lọc, vỏ nhựa</p>
                
                  <p class="protection-content">- Lắp lại như cũ</p>
                
              </div>
              <div class="col-md-6 col-sm-6 item-Height70">
                
                  <p class="protection-content">- Bật máy lạnh và kiểm tra lại lần cuối</p>
                
              </div>
            </div>
          </div>
          <div id="box6" class="tab-pane fade in">
            <div class="row largepadding-row">
              <div class="col-md-6 col-sm-6 border-right item-Height70">
                
                  <p class="protection-content">- Đo lường lượng gas của máy</p>
                
                  <p class="protection-content">- Gắn đầu dây vào bình gas và đồng hồ</p>
                
              </div>
              <div class="col-md-6 col-sm-6 item-Height70">
                
                  <p class="protection-content">- Tiến hành bơm hoặc hút theo tình trạng của máy</p>
                
                  <p class="protection-content">- Bật máy hoạt động và kiểm tra lại</p>
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <%@include file= "FooterNguoidung.jsp"%>