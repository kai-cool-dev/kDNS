<div class="row">
  <div class="col-lg-3">
    {{ link_to('dns/administrateNS','<i class="fas fa-wrench"></i> Edit authorative Nameserver', 'class': 'btn btn-primary form-control') }}
  </div>
  <div class="col-lg-3">
    {{ link_to('dns/administrateRecursor','<i class="fas fa-wrench"></i> Edit recursor Nameserver', 'class': 'btn btn-primary form-control') }}
  </div>
  <div class="col-lg-3">
    {{ link_to('dns/administrateType','<i class="fas fa-wrench"></i> Edit Record Types', 'class': 'btn btn-primary form-control') }}
  </div>
  <div class="col-lg-3">
    {{ link_to('dns/administrateTLD','<i class="fas fa-wrench"></i> Edit Top Level Domains', 'class': 'btn btn-primary form-control') }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    <h1><i class="fas fa-server"></i>Manage recursor Nameserver</h1>
    <hr>
    <p>These are the settings for your PowerDNS Server</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>
