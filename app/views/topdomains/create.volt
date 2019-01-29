<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1><i class="fas fa-plus"></i> Create new Top Level Domain</h1>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-4">
            {{ link_to('topdomains/index/', '<i class="fas fa-angle-left"></i> Back', 'class':'form-control btn btn-primary') }}
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
        <form method="post" action="{{ url('topdomains/create/') }}">
          <div class="row">
            <div class="col-lg-12">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Name</span>
                </div>
                {{ topdomainform.render('name') }}
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
                  <span class="input-group-text">Description</span>
                </div>
                {{ topdomainform.render('description') }}
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
              <button type="submit" class="btn btn-success form-control"><i class="fas fa-plus"></i> Create</button>
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
