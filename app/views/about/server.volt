<div class="row">
	<div class="col-lg-12">
		<h1><i class="fas fa-server"></i> Our Servers</h1>
	</div>
</div>

<div class="row">
  {% for nameserver in nameservers %}
  	<div class="col-lg-4">
      <div class="card">
        <div class="card-body">
          <h2><i class="fas fa-server"></i> {{ nameserver.name }}</h2>
          <p>FQDN: {{ nameserver.fqdn }}</p>
          {% if nameserver.ip4 %}
            <p>IPv4: {{ nameserver.ip4 }}</p>
          {% endif %}
          {% if nameserver.ip6 %}
            <p>IPv6: {{ nameserver.ip6 }}</p>
          {% endif %}
        </div>
      </div>
  	</div>
  {% endfor %}
</div>
