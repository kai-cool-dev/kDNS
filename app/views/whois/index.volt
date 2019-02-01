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
									<p class="card-text">Owner: <b>{{ display["user"] }}</b> (<b>{{ display["email"] }}</b>)</p>
									<p class="card-text">Created: <b>{{ display["created"] }}</b></p>
									<p class="card-text">Description: <b>{{ display["description"] }}</b></p>
									<hr>
									{% for nameserver in display["nameserver"] %}
									<p class="card-text">Nameserver: <b>{{ nameserver.name }}</b> (<b>{{ nameserver.fqdn }}</b>)
										{% if nameserver.ip4 %}
											<a href="https://www.shodan.io/host/{{ nameserver.ip4 }}" target="_blank" data-toggle="tooltip" data-placement="bottom" title="View IPv4 Information via Shodan.io"><i class="fas fa-info-circle"></i></a>
										{% endif %}
										{% if nameserver.ip6 %}
											<a href="https://www.shodan.io/host/{{ nameserver.ip6 }}" target="_blank" data-toggle="tooltip" data-placement="bottom" title="View IPv6 Information via Shodan.io"><i class="fas fa-info-circle"></i></a>
										{% endif %}
									</p>
									{% endfor %}
								</div>
							</div>
						{% endif %}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
