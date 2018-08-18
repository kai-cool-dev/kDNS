<div class="row">
	<div class="col-lg-12">
		<header class="jumbotron subhead" id="overview">
			<div class="hero-unit">
				<h1>Welcome to Peppermint.Cloud DNS Service!</h1>
				<p class="lead">Your premium DNS Service. Without costs!</p>
				<div class="row">
					<div class="col-lg-6">
						{{ link_to('session/signup', '<i class="fas fa-user-plus"></i> Signup for Free', 'class': 'btn btn-primary btn-large form-control') }}
					</div>
					<div class="col-lg-6">
						{{ link_to('session/login', '<i class="fas fa-sign-in-alt"></i> Login', 'class': 'btn btn-success btn-large form-control') }}
					</div>
				</div>
			</div>
		</header>
	</div>
</div>

<div class="row">
	<div class="col-lg-4">
		<h2>Free!</h2>
		<p>Our service is free to use. No Credit Card or PayPal required for signup or for using the service.</p>
	</div>
	<div class="col-lg-4">
		<h2>Reliable</h2>
		<p>We use a high availability mysql cluster, local database syncs on our nameserver (for failover, if the main mysql cluster dies, never happened). PowerDNS is the choice of software to use in our infrastructure, it is fast and lightweight.</p>
	</div>
	<div class="col-lg-4">
		<h2>Non-Profit</h2>
		<p>We operate on non-profit base and therefore we need donations to keep our services live. {{ link_to('donate','Maybe you want to donate some bucks?') }}</p>
	</div>
</div>
