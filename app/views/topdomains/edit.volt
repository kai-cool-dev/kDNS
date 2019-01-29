<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1><i class="fas fa-info-circle"></i> Top Level Domain {{ link_to('topdomains/edit/' ~ topdomain.id,topdomain.name) }}</h1>
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
        <form method="post" action="{{ url('topdomains/update/' ~ topdomain.id) }}">
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
            <div class="col-lg-6">
              <button type="submit" class="btn btn-success form-control"><i class="fas fa-save"></i> Save Details</button>
            </div>
            <div class="col-lg-6">
              {{ link_to('topdomains/delete/' ~ topdomain.id ~ '/','<i class="fas fa-trash"></i> Delete Top Level Domain','class':'btn btn-danger form-control') }}
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
