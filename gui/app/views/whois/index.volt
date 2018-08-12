<div class="row">
	<div class="col-lg-12">
		<h1><i class="fas fa-question"></i> Whois</h1>
		<hr>
		<p>Get whois information for a domain used by this nameservers.<br>
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
		{{ content() }}
	</div>
</div>

{% if display %}
<div class="row">
	<div class="col-lg-12">
    <pre>
      ### kDNS Whois Service
      # This is the kDNS Whois Service.
      ###
      Domain:       {{ display["name"] }}

      Owner:        {{ display["user"] }} ({{ display["email"] }})
      Created:      {{ display["created"] }}

      Description:  {{ display["description"] }}
    </pre>
	</div>
</div>
{% endif %}
