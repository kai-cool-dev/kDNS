<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1><i class="fas fa-info-circle"></i> Nameserver {{ link_to('nameserver/edit/' ~ nameserver.id,nameserver.name) }}</h1>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4">
            {{ link_to('nameserver/index/', '<i class="fas fa-angle-left"></i> Back', 'class':'form-control btn btn-primary') }}
          </div>
          <div class="col-lg-8">
            {{ content() }}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <form method="post" action="{{ url('nameserver/update/' ~ nameserver.id) }}">
          <div class="row">
            <div class="col-lg-4">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">IPv4 Address</span>
                </div>
                {{ nameserverform.render('ip4') }}
              </div>
            </div>
            <div class="col-lg-4">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">IPv6 Address</span>
                </div>
                {{ nameserverform.render('ip6') }}
              </div>
            </div>
            <div class="col-lg-4">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">DNS FQDN</span>
                </div>
                {{ nameserverform.render('fqdn') }}
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <hr>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Type</span>
                </div>
                {{ nameserverform.render('type') }}
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <hr>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Description</span>
                </div>
                {{ nameserverform.render('description') }}
              </div>
            </div>
            <div class="col-lg-6">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Domains</span>
                </div>
                {{ nameserverform.render('topdomains') }}
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <hr>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-6">
              <button type="submit" class="btn btn-success form-control"><i class="fas fa-save"></i> Save Details</button>
            </div>
            <div class="col-lg-6">
              {{ link_to('nameserver/delete/' ~ nameserver.id,'<i class="fas fa-trash"></i> Delete Nameserver','class':'btn btn-danger form-control') }}
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
