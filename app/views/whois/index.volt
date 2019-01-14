<div class="row">
	<div class="col-lg-12">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-lg-12">
						<h1><i class="fas fa-question"></i> Whois</h1>
						<hr>
						<p>Get whois information for a domain used by this nameservers.<br>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-12">
						{{ content() }}
					</div>
				</div>
				<form method="post">
					<div class="row">
						<div class="col-lg-10">
						  {{ form.render('name')}}
						</div>
						<div class="col-lg-2">
						  <button type="submit" class="form-control btn btn-primary"><i class="fas fa-question"></i> Whois</button>
						</div>
					</div>
				</form>
				<div class="row">
					<div class="col-lg-12">
						{% if display %}
							<div class="card">
								<div class="card-body">
									<h5 class="card-title">This is the kDNS Whois Service.</h5>
									<h6 class="card-subtitle text-muted">WE DO NOT GUARANTEE THAT THIS INFORMATION IS CORRECT.</h6>
									<hr>
									<p class="card-text">Domain: <b>{{ display["name"] }}</b></p>
									<p class="card-text">Owner: <b>{{ display["user"] }} ({{ display["email"] }})</b></p>
									<p class="card-text">Created: <b>{{ display["created"] }}</b></p>
									<p class="card-text">Description: <b>{{ display["description"] }}</b></p>
								</div>
							</div>
						{% endif %}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
