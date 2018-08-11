<div class="row">
  <div class="col-lg-12">
    <h1>Welcome to kDNS</h1>
    <hr>
    <p>Here are your domains listed. If you don't have any. Just create one!</p>
  </div>
</div>

<div class="row">
  <div class="col-lg-12">
    {{ content() }}
  </div>
</div>

<form method="post" autocomplete="off">
  {{ form.render("id") }}

  <div class="row">
    <div class="col-lg-6">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">Name</span>
        </div>
        {{ form.render("name") }}
      </div>
    </div>
    <div class="col-lg-6">
      <div class="input-group mb-3">
        <div class="input-group-prepend">
          <span class="input-group-text">Active</span>
        </div>
        {{ form.render("active") }}
      </div>
    </div>
  </div>

  <div class="row">
    <div class="col-lg-6">
      {{ link_to("profiles/search", '<i class="fas fa-angle-left"></i> Go Back', 'class' : 'form-control btn btn-primary') }}
    </div>
    <div class="col-lg-6">
      <button type="submit" class="btn btn-success form-control"><i class="fas fa-save"></i> Save</button>
    </div>
  </div>
</form>

<div class="row">
  <div class="col-lg-12">
    <table class="table table-bordered table-striped" align="center">
      <thead>
        <tr>
          <th>ID</th>
          <th>Name</th>
          <th>Banned</th>
          <th>Suspended</th>
          <th>Active</th>
        </tr>
      </thead>
      <tbody>
        {% for user in profile.users %}
        <tr>
          <td>{{ user.id }}</td>
          <td>{{ user.name }}</td>
          <td>{{ user.banned == 'Y' ? 'Yes' : 'No' }}</td>
          <td>{{ user.suspended == 'Y' ? 'Yes' : 'No' }}</td>
          <td>{{ user.active == 'Y' ? 'Yes' : 'No' }}</td>
          <td width="12%">{{ link_to("users/edit/" ~ user.id, '<i class="fas fa-edit"></i> Edit', "class": "btn btn-primary form-control") }}</td>
          <td width="12%">{{ link_to("users/delete/" ~ user.id, '<i class="fas fa-trash"></i> Delete', "class": "btn btn-danger form-control") }}</td>
        </tr>
        {% else %}
          <tr><td colspan="3" align="center">There are no users assigned to this profile</td></tr>
        {% endfor %}
        </tbody>
    </table>
  </div>
</div>
