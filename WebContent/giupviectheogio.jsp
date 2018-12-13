<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="HeaderNguoidung.jsp"%>
	
<div class="main-banner">
	<div class="banner-holder">
		<div class="gradient-layer-box"></div>
		<img src="./images/giupviectheogio/service2.jpg" alt="">
		<div class="text-in-banner">
			<h1>Giúp việc nhà theo giờ</h1>
			<%
	    	if("3".equalsIgnoreCase(maquyen)){
	   		 %>
		    	<a href="javascript:;" class="btn-normal scroll-download dangkydichvu-modal" data-popup-open="popup-1" style="text-decoration: none;">Đăng ký dịch vụ</a>
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
			<h2 class="heading2 max-width">Vì sao nên dùng dịch vụ giúp việc
				nhà theo giờ của DaNaLiKinh</h2>
			<div class="row">
				<div class="col-sm-4 col-md-4">
					<div
						class="interest-wrapper become-tk-interest text-center DaNaLiKinh-interest-Height item-Height348">
						<img src="./images/giupviectheogio/sky-gun.svg" alt="">
						<h3>Nhanh chóng – Tiện lợi</h3>
						<p>Với 60 giây thao tác trên ứng dụng, bạn sẽ có ngay người
							đến phụ giúp việc nhà.</p>
					</div>
				</div>
				<div class="col-sm-4 col-md-4">
					<div
						class="interest-wrapper become-tk-interest text-center DaNaLiKinh-interest-Height item-Height348">
						<img src="./images/giupviectheogio/hand.svg" alt="">
						<h3>Dịch vụ chất lượng</h3>
						<p>Người giúp việc chuyên nghiệp, được hệ thống đánh giá và
							sàng lọc thường xuyên.</p>
					</div>
				</div>
				<div class="col-sm-4 col-md-4">
					<div
						class="interest-wrapper become-tk-interest text-center DaNaLiKinh-interest-Height item-Height348">
						<img src="./images/giupviectheogio/thumb.png" alt="">
						<h3>Không bị phụ thuộc vào một người giúp việc</h3>
						<p>Với hơn 3.000 người giúp việc của DaNaLiKinh, bạn sẽ luôn
							có người phụ giúp việc nhà trong bất cứ thời điểm nào.</p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Interest DaNaLiKinh -->
</div>

<!--Difference -->
<div class="difference section-space" style="background-color: #fff">
	<div class="container">
		<h2 class="heading2 text-center">DaNaLiKinh và giúp việc truyền
			thống khác nhau như thế nào</h2>
		<div class="row">
			<div class="col-md-6 col-sm-6 no-padding-right top-index">
				<div class="row nopadding-row">
					<div class="col-md-4 col-sm-3 col-xs-2 hidden-xs">
						<img src="./images/giupviectheogio/l-bg-plus.png" alt=""
							class="bg-plus">
					</div>
					<div class="col-md-8 col-sm-9 col-xs-12">
						<ul class="difference-list right">
							<li class="primary-background">
								<p class="gen-medi-text text-center white-text">Giúp việc
									theo giờ DaNaLiKinh</p>
							</li>
							<li>
								<p class="gen-text">
									<strong>15 - 20 phút</strong> <br> để có người giúp việc
								</p>
							</li>
							<li>
								<p class="gen-text">
									<strong>Không</strong> tốn phí dịch vụ
								</p>
							</li>
							<li>
								<p class="gen-text">
									<strong>1,200,000 VND</strong> chi phí trung bình <br>(2
									buổi/tuần, 3 giờ/buổi)
								</p>
							</li>
							<li>
								<p class="gen-text">
									Chất lượng dựa trên <strong>50.000 khách hàng</strong>
								</p>
							</li>
							<li>
								<div class="gen-text">
									<strong>Không</strong> hợp đồng
								</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<div class="col-md-6 col-sm-6 no-padding-left">
				<div class="row nopadding-row">
					<div class="col-md-8 col-sm-9 col-xs-12">
						<ul class="difference-list left">
							<li>
								<p class="gen-medi-text text-center white-text">Giúp việc
									truyền thống</p>
							</li>
							<li>
								<p class="gen-text">
									<strong>2 - 3 ngày</strong> <br> để có người giúp việc
								</p>
							</li>
							<li>
								<p class="gen-text">
									<strong>Tốn phí</strong> môi giới nếu qua môi giới
								</p>
							</li>
							<li>
								<p class="gen-text">
									<strong>3,500,000 VND</strong> chi phí trung bình <br>(2
									buổi/tuần, 3 giờ/buổi)
								</p>
							</li>
							<li>
								<p class="gen-text">
									Chất lượng dựa trên <strong> sự giới thiệu</strong>
								</p>
							</li>
							<li>
								<div class="gen-text">
									<strong>Có</strong> hợp đồng
								</div>
							</li>
						</ul>
					</div>
					<div class="col-md-4 col-sm-3 text-right  hidden-xs">
						<img src="./images/giupviectheogio/r-bg-plus.png" alt=""
							class="bg-plus">
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="contentContainer"></div>

<!--Table price  -->
<div class="table-service-price section-space">
	<div class="container">
		<h2 class="heading2 text-center white-text">Bảng giá tham khảo</h2>
		<div class="">
			<table class="table table-price table-price-maid">
				<thead>
					<tr>

						<th>Diện tích</th>

						<th>Số phòng</th>

						<th>Số giờ</th>

						<th>Giá</th>

						<th>Giá/1h</th>

					</tr>
				</thead>
				<tbody>
					<tr>

						<td data-text="Diện tích">55m2</td>

						<td data-text="Số phòng">2</td>

						<td data-text="Số giờ">2</td>

						<td data-text="Giá">100,000 VND</td>

						<td data-text="Giá/1h">50,000 VND</td>

					</tr>
					<tr>

						<td data-text="Diện tích">85m2</td>

						<td data-text="Số phòng">3</td>

						<td data-text="Số giờ">3</td>

						<td data-text="Giá">144,000 VND</td>

						<td data-text="Giá/1h">48,000 VND</td>

					</tr>
					<tr>

						<td data-text="Diện tích">105m2</td>

						<td data-text="Số phòng">4</td>

						<td data-text="Số giờ">4</td>

						<td data-text="Giá">180,000 VND</td>

						<td data-text="Giá/1h">45,000 VND</td>

					</tr>
					<tr>

						<td data-text="Diện tích">125m2</td>

						<td data-text="Số phòng">5</td>

						<td data-text="Số giờ">5</td>

						<td data-text="Giá">215,000 VND</td>

						<td data-text="Giá/1h">43,000 VND</td>

					</tr>
					<tr>
						<td colspan="5">* Nếu thời gian thực hiện công việc nhiều hơn
							4 giờ, bạn nên đặt 2 người giúp việc bằng cách đăng việc 2 lần.</td>
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
		<h2 class="heading2 text-center">Quy trình chuẩn dọn dẹp nhà cửa</h2>
		<h3 class="text-center heading3">

			<p class="font-size-16">Các Cộng Tác Viên của DaNaLiKinh sẽ thực
				hiện việc dọn dẹp nhà theo đúng quy trình dưới đây.</p>

			<p class="font-size-16">Nếu có nhu cầu dọn dẹp khác, khách hàng
				vui lòng ghi chú cụ thể trong lúc đăng việc.</p>

		</h3>
		<br>
		<ul id="collapseTabMob"
			class="list-steps-protection maid-page text-center hidden-xs">
			<li class=" item-Height"><a href="#box1" data-toggle="tab">
					<span id="info-hover"> <img
						src="./images/giupviectheogio/info_off.svg" alt=""
						class="svg svg-image">
				</span>
					<p class="gen-text">Quy tắc chung</p>
			</a></li>
			<li class="item-Height"><a href="#box2" data-toggle="tab"> <span
					id="tools-hover"> <img
						src="./images/giupviectheogio/tools-and-utensils.svg" alt=""
						class="svg svg-image">
				</span>
					<p class="gen-text">Dụng cụ và các chất tẩy rửa</p>
			</a></li>
			<li class="item-Height"><a href="#box3" data-toggle="tab"> <span
					id="bed-hover"> <img src="./images/giupviectheogio/bed.svg"
						alt="" class="svg svg-image">
				</span>
					<p class="gen-text">Quy tắc dọn phòng ngủ</p>
			</a></li>
			<li class="item-Height"><a href="#box4" data-toggle="tab"> <span
					id="couch-hover"> <img
						src="./images/giupviectheogio/sofa.svg" alt=""
						class="svg svg-image">
				</span>
					<p class="gen-text">Quy tắc dọn phòng khách</p>
			</a></li>
			<li class="item-Height"><a href="#box5" data-toggle="tab"> <span
					id="stove-hover"> <img
						src="./images/giupviectheogio/stove.svg" alt=""
						class="svg svg-image">
				</span>
					<p class="gen-text">Quy tắc dọn bếp</p>
			</a></li>
			<li class="item-Height"><a href="#box6" data-toggle="tab"> <span
					id="toilet-hover"> <img
						src="./images/giupviectheogio/toilet.svg" alt=""
						class="svg svg-image">
				</span>
					<p class="gen-text">Quy tắc dọn nhà vệ sinh</p>
			</a></li>
		</ul>
		<div class="panel-group visible-xs" id="collapseTabMob-accordion"></div>
		<div class="protection-steps-box-holder hidden-xs">
			<div class="tab-content">
				<div id="box1" class="tab-pane fade in active">
					<div class="row largepadding-row">
						<div class="col-md-6 col-sm-6 border-right item-Height430">
							<p class="protection-content">
								<b>Quy tắc vệ sinh nhà cửa chung áp dụng cho việc dọn dẹp:</b>
							</p>

							<p class="protection-content">- Dọn từ trên xuống dưới, từ
								cao xuống thấp, từ trong ra ngoài.</p>

							<p class="protection-content">- Tầng thượng làm trước, sau đó
								lần lượt xuống các tầng dưới.</p>

							<p class="protection-content">- Dọn từ bếp ra ngoài sân, dọn
								phòng lớn trước, phòng nhỏ sau.</p>

							<p class="protection-content">- Dọn nơi sạch trước, nơi bẩn
								sau. Phòng ngủ dọn trước đến phòng khách, nhà bếp, nhà tắm và
								toilet.</p>

							<p class="protection-content">- Phòng nào cũng quét dọn bụi,
								mạng nhện từ trong góc nhà ra trước, rồi gầm bàn, gầm tủ...
								Không bỏ qua bất kỳ ngóc ngách hay dưới gầm đồ đạc nào.</p>

							<p class="protection-content">- Dọn phòng nào xong, dứt điểm
								phòng đó.</p>

							<p class="protection-content">
								<b>Lưu ý: </b>Để hoàn thành tốt công việc theo sự hài lòng của
								khách hàng, người giúp việc nên hỏi ý muốn khách hàng trước khi
								dọn dẹp, không tự ý quyết định thực hiện để tránh việc không
								đúng theo mong muốn của khách hàng.
							</p>
						</div>
						<div class="col-md-6 col-sm-6 item-Height430">
							<p class="protection-content">
								<b>Quy trình dọn dẹp chung</b>
							</p>

							<p class="protection-content">- Phủi bụi thảm chùi chân và
								mang ra phơi để tránh ướt hoặc bẩn thảm trong lúc dọn dẹp.</p>

							<p class="protection-content">- Phủi bụi rèm cửa.</p>

							<p class="protection-content">- Lau chùi cửa kính, cửa phòng.</p>

							<p class="protection-content">- Lau bề mặt các vật dụng trong
								phòng và đặt lại như vị trí ban đầu.</p>

							<p class="protection-content">- Thu gom các vật dụng bẩn,
								quần áo, khăn bẩn; rửa, giặt các vật dụng nếu khách có yêu cầu.</p>

							<p class="protection-content">- Hút hoặc quét bụi toàn bộ
								sàn.</p>

							<p class="protection-content">- Lau sàn nhà.</p>

							<p class="protection-content">- Gom toàn bộ rác và mang đến
								khu vực đổ rác.</p>

							<p class="protection-content">- Mang thảm chùi chân đặt lại
								chỗ cũ.</p>

						</div>
					</div>
				</div>
				<div id="box2" class="tab-pane fade in">
					<div class="row largepadding-row">
						<div class="col-md-6 col-sm-6 border-right item-Height245">
							<p class="protection-content">
								<b>Các dụng cụ dọn dẹp tiêu chuẩn:</b>
							</p>

							<p class="protection-content">- Xô và cây lau nhà</p>

							<p class="protection-content">- Chổi quét bụi</p>

							<p class="protection-content">- Chổi quét rác và ky hốt rác</p>

							<p class="protection-content">- Cọ chà toilet</p>

							<p class="protection-content">- Các loại khăn và giẻ lau</p>

							<p class="protection-content">- Bàn chải</p>

						</div>
						<div class="col-md-6 col-sm-6 item-Height245">
							<p class="protection-content">
								<b>Các dung dịch tẩy rửa tiêu chuẩn:</b>
							</p>

							<p class="protection-content">- Nước lau sàn</p>

							<p class="protection-content">- Nước rửa chén</p>

							<p class="protection-content">- Nước rửa kính</p>

							<p class="protection-content">- Dung dịch tẩy rửa nhà vệ sinh</p>

						</div>
					</div>
				</div>
				<div id="box3" class="tab-pane fade in">
					<div class="row largepadding-row">
						<div class="col-md-6 col-sm-6 border-right item-Height175">

							<p class="protection-content">- Phủi bụi rèm cửa.</p>

							<p class="protection-content">- Lau cửa kính.</p>

							<p class="protection-content">- Quét và lau bụi các đồ dùng,
								bàn ghế, tủ kệ.</p>

							<p class="protection-content">- Thu gom, phân loại quần áo
								bẩn.</p>

							<p class="protection-content">- Giặt và phơi quần áo (Giặt
								bằng máy).</p>

						</div>
						<div class="col-md-6 col-sm-6 item-Height175">

							<p class="protection-content">- Giũ chăn, mền, gối, ga
								giường.</p>

							<p class="protection-content">- Xếp chăn mền, thay ga giường
								mới.</p>

							<p class="protection-content">- Hút hoặc quét bụi sàn.</p>

							<p class="protection-content">- Lau sàn nhà.</p>

							<p class="protection-content">- Thu gom và đổ rác.</p>

						</div>
					</div>
				</div>
				<div id="box4" class="tab-pane fade in">
					<div class="row largepadding-row">
						<div class="col-md-6 col-sm-6 border-right item-Height105">

							<p class="protection-content">- Phủi bụi rèm cửa.</p>

							<p class="protection-content">- Lau cửa kính.</p>

							<p class="protection-content">- Quét và lau bụi các đồ dùng,
								bàn ghế, tủ kệ.</p>

						</div>
						<div class="col-md-6 col-sm-6 item-Height105">

							<p class="protection-content">- Hút hoặc quét bụi toàn bộ
								sàn.</p>

							<p class="protection-content">- Lau sàn nhà.</p>

							<p class="protection-content">- Thu gom và đổ rác.</p>

						</div>
					</div>
				</div>
				<div id="box5" class="tab-pane fade in">
					<div class="row largepadding-row">
						<div class="col-md-6 col-sm-6 border-right item-Height140">

							<p class="protection-content">- Rửa, úp và sắp xếp chén, đĩa.</p>

							<p class="protection-content">- Lau chùi, vệ sinh bề mặt bếp
								ga.</p>

							<p class="protection-content">- Vệ sinh và sắp xếp lại các
								dụng cụ.</p>

							<p class="protection-content">- Lau chùi các tủ, kệ, bàn ghế.</p>

						</div>
						<div class="col-md-6 col-sm-6 item-Height140">

							<p class="protection-content">- Vệ sinh tủ lạnh.</p>

							<p class="protection-content">- Bao bọc, sắp xếp lại thức ăn.</p>

							<p class="protection-content">- Quét và lau sàn nhà.</p>

							<p class="protection-content">- Thu gom và đổ rác.</p>

						</div>
					</div>
				</div>
				<div id="box6" class="tab-pane fade in">
					<div class="row largepadding-row">
						<div class="col-md-6 col-sm-6 border-right item-Height175">

							<p class="protection-content">- Lau chùi và sắp xếp các vật
								dụng trong nhà vệ sinh.</p>

							<p class="protection-content">- Vệ sinh các tủ kệ.</p>

							<p class="protection-content">- Vệ sinh bồn rửa mặt, gương
								soi.</p>

							<p class="protection-content">- Vệ sinh bồn tắm.</p>

							<p class="protection-content">- Tẩy uế bên trong và ngoài bồn
								cầu</p>

						</div>
						<div class="col-md-6 col-sm-6 item-Height175">

							<p class="protection-content">- Loại bỏ rác, tóc ở miệng cống
								thoát và bỏ vào thùng rác.</p>

							<p class="protection-content">- Lau sàn nhà vệ sinh.</p>

							<p class="protection-content">- Thu gom và đổ rác.</p>

							<p class="protection-content">- Thay hoặc thêm giấy vệ sinh,
								các loại xà phòng, nước tẩy rửa.</p>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@include file="FooterNguoidung.jsp"%>