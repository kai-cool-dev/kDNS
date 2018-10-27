<div class="row">
  <div class="col-lg-12">
    <h1><i class="fas fa-server"></i> Administrate Top Level Domains</h1>
    <hr>
    <p>Here you can manage your Top Level Domains. All these TLDs are allowed to create in this UI.<br>
    We automatically inserted all internet-reachable TLDs and private TLDs (such as .local, .ip, etc).<br>
    You can add your own too!</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {% for tld in tlds %}
      {% if loop.first %}
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
          </tr>
        </thead>
        <tbody>
          <tr>
            <form method="post">
              <th scope="row">NEW</th>
              <td><div class="input-group">{{ form.render('value') }}</div></td>
              <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
            </form>
          </tr>
      {% endif %}
          <tr>
            <form method="post">
              <input type="hidden" name="id" value="{{ tld.id }}" />
              <th scope="row">#{{ tld.id }}</th>
              <td><p class="form-control">.{{ tld.value }}</p></td>
              <td><button type="submit" class="btn form-control btn-danger" name="action" value="delete" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash"></i></button></td>
            </form>
          </tr>
      {% if loop.last %}
        </tbody>
      </table>
      {% endif %}
    {% else %}
      <h2>Add your first Top Level Domain.</h2>
      <table class="table table-striped">
        <tr>
          <form method="post">
            <th scope="row">NEW</th>
            <td><div class="input-group">{{ form.render('value') }}</div></td>
            <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
          </form>
        </tr>
      </table>
    {% endfor %}
  </div>
</div>
