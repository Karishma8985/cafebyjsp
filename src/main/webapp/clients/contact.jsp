<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Restoran - Bootstrap Restaurant Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="" name="keywords">
<meta content="" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600&family=Nunito:wght@600;700;800&family=Pacifico&display=swap"
	rel="stylesheet">

<!-- Icon Font Stylesheet -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
	rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css"
	rel="stylesheet" />

<!-- Customized Bootstrap Stylesheet -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Template Stylesheet -->
<link href="../css/style.css" rel="stylesheet">
</head>

<body>
	 <%@ include file="commonpage.jsp"%>
		
	<!-- Contact Start -->
	<div class="container-xl-fluid">
		<div class="container">
			<div class="text-center wow fadeInUp" data-wow-delay="0.1s">
				<h5
					class="section-title ff-secondary text-center text-primary fw-normal">Contact
					Us</h5>
				<h1 class="mb-5">Contact For Any Query</h1>
			</div>
			<div class="row g-4">
				<div class="col-12">
					<div class="row gy-4">
						<div class="col-md-4">
							<h5
								class="section-title ff-secondary fw-normal text-start text-primary">Booking</h5>
							<p>
								<i class="fa fa-envelope-open text-primary me-2"></i>book@coffeecafeday.com
							</p>
						</div>
						<div class="col-md-4">
							<h5
								class="section-title ff-secondary fw-normal text-start text-primary">General</h5>
							<p>
								<i class="fa fa-envelope-open text-primary me-2"></i>info@coffeecafeday.com
							</p>
						</div>
						<div class="col-md-4">
							<h5
								class="section-title ff-secondary fw-normal text-start text-primary">Technical</h5>
							<p>
								<i class="fa fa-envelope-open text-primary me-2"></i>tech@coffeecafeday.com
							</p>
						</div>
					</div>
				</div>
				<div class="col-md-6 wow fadeIn" data-wow-delay="0.1s">
					<iframe
						src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d58755.513122290286!2d72.49360799789426!3d23.015708923913266!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395e84fae22a842f%3A0x651cbb235d5b8e8e!2sCaf%C3%A9%20Coffee%20Day!5e0!3m2!1sen!2sin!4v1721812671758!5m2!1sen!2sin"
						width="600" height="450" style="border: 0;" allowfullscreen=""
						loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
				</div>
				<div class="col-md-6">
					<div class="wow fadeInUp" data-wow-delay="0.2s">
						<form>
							<div class="row g-3">
								<div class="col-md-6">
									<div class="form-floating">
										<input type="text" class="form-control" id="name"
											placeholder="Your Name"> <label for="name">Your
											Name</label>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-floating">
										<input type="email" class="form-control" id="email"
											placeholder="Your Email"> <label for="email">Your
											Email</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<input type="text" class="form-control" id="subject"
											placeholder="Subject"> <label for="subject">Subject</label>
									</div>
								</div>
								<div class="col-12">
									<div class="form-floating">
										<textarea class="form-control"
											placeholder="Leave a message here" id="message"
											style="height: 150px"></textarea>
										<label for="message">Message</label>
									</div>
								</div>
								<div class="col-12">
									<button class="btn btn-primary w-100 py-3" type="submit">Send
										Message</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Contact End -->
	<%@ include file="footer.jsp"%>