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
    <h1><i class="fas fa-server"></i> Manage authorative Nameserver</h1>
    <hr>
    <p>These are the settings for your PowerDNS Server</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {% for nameserver in nameservers %}
      {% if loop.first %}
      <table class="table table-striped">
        <thead>
          <tr>
            <th scope="col">#</th>
            <th scope="col">Name</th>
            <th scope="col">FQDN</th>
            <th scope="col">IPv4 Address</th>
            <th scope="col">IPv6 Address</th>
            <th scope="col"></th>
          </tr>
        </thead>
        <tbody>
      {% endif %}
          <tr>
            <form method="post">
              <input type="hidden" name="id" value="{{ nameserver.id }}" />
              <th scope="row">#{{ nameserver.id }}</th>
              <td>{{ nameserver.name }}</td>
              <td>{{ nameserver.fqdn }}</td>
              <td>{{ nameserver.ip4 }}</td>
              <td>{{ nameserver.ip6 }}</td>
              <td><button type="submit" class="btn form-control btn-danger" name="action" value="delete" data-toggle="tooltip" data-placement="bottom" title="Delete"><i class="fas fa-trash"></i></button></td>
            </form>
          </tr>
      {% if loop.last %}
          <tr>
            <form method="post">
              <th scope="row">NEW</th>
              <td><div class="input-group">{{ form.render('name') }}</div></td>
              <td><div class="input-group">{{ form.render('fqdn') }}</div></td>
              <td><div class="input-group">{{ form.render('ip4') }}</div></td>
              <td><div class="input-group">{{ form.render('ip6') }}</div></td>
              <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
            </form>
          </tr>
        </tbody>
      </table>
      {% endif %}
    {% else %}
      <h2>Add your first Nameserver.</h2>
      <table class="table table-striped">
        <tr>
          <form method="post">
            <th scope="row">NEW</th>
            <td><div class="input-group">{{ form.render('name') }}</div></td>
            <td><div class="input-group">{{ form.render('fqdn') }}</div></td>
            <td><div class="input-group">{{ form.render('ip4') }}</div></td>
            <td><div class="input-group">{{ form.render('ip6') }}</div></td>
            <td><button type="submit" class="btn form-control btn-success" name="action" value="create" data-toggle="tooltip" data-placement="bottom" title="Create"><i class="fas fa-plus"></i> </button></td>
          </form>
        </tr>
      </table>
    {% endfor %}
  </div>
</div>
