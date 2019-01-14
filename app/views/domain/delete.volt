<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1><i class="fas fa-trash"></i> Delete Domain {{ link_to('domain/edit/' ~ domain.id,domain.name) }}</h1>
            <hr>
            <p>Do you really want to delete the domain? Every Record will be purged first.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
          </div>
        </div>
        <div class="row">
          <div class="col-lg-2">
            {{ link_to('domain/edit/' ~ domain.id, '<i class="fas fa-angle-left"></i> Back', 'class':'form-control btn btn-primary') }}
          </div>
          <div class="col-lg-10">
            <form method="post">
              <button type="submit" class="form-control btn btn-danger"><i class="fas fa-trash"></i> Delete</button>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
