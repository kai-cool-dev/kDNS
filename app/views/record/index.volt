<div class="row">
  <div class="col-lg-12">
    <div class="card">
      <div class="card-body">
        <div class="row">
          <div class="col-lg-12">
            <h1>List Records of {{ link_to('domain/edit/' ~ domain.id,domain.name) }}</h1>
            <hr>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            {{ content() }}
          </div>
        </div>
        {% for record in records.items %}
        {% if loop.first %}
        <div class="row">
          <div class="col-lg-12">
            <table class="table table-striped table-borderless">
              <thead>
                <th scope="col">Name</th>
                <th scope="col">Type</th>
                <th scope="col">Content</th>
                <th scope="col" colspan="4"></th>
              </thead>
              <tbody>
                <tr>
                  <form method="post" action="{{ url('record/create/' ~ domain.id) }}">
                    <td>
                      <div class="input-group">
                        {{ new_record.render('name') }}
                        <div class="input-group-append">
                          <span class="input-group-text">.{{ domain.name }}</span>
                        </div>
                      </div>
                    </td>
                    <td>
                      <div class="input-group">
                        {{ new_record.render('type') }}
                      </div>
                    </td>
                    <td>
                      <div class="input-group">
                        {{ new_record.render('content') }}
                      </div>
                    </td>
                    <td colspan="4">
                      <button type="submit" class="btn form-control btn-success" data-toggle="tooltip" data-placement="bottom" title="Create new Record"><i class="fas fa-plus"></i> Create</button>
                    </td>
                  </form>
                </tr>
        {% endif %}
                <tr>
                  <input type="hidden" id="ttl_{{ record.id }}" value="{{ record.ttl }}">
                  <input type="hidden" id="prio_{{ record.id }}" value="{{ record.prio }}">
                  <th scope="row"><div class="input-group"><input type="text" id="name_{{ record.id }}" class="form-control" value="{{ record.name }}" disabled></div></th>
                  <td><div class="input-group"><input type="text" id="type_{{ record.id }}" class="form-control" value="{{ record.type }}" disabled></div></td>
                  <th scope="row"><div class="input-group"><input type="text" id="content_{{ record.id }}" class="form-control" value='{{ record.content }}' disabled></div></th>
                {% if record.type is not "SOA" and record.type is not "NS" %}
                  <td><button class="btn form-control btn-primary" onclick="edit_modal({{ record.id }})" data-toggle="tooltip" data-placement="bottom" title="Edit this Record"><i class="fas fa-edit"></i></button></td>
                  <td><button class="btn form-control btn-secondary" onclick="ttl_modal({{ record.id }})" data-toggle="tooltip" data-placement="bottom" title="Change TTL or Priority of the Record"><i class="far fa-calendar-check"></i></button></td>
                  {% if record.disabled == 0 %}
                    <td>{{ link_to('record/disable/' ~ domain.id ~ '/' ~ record.id,'<i class="fas fa-ban"></i>','class':'btn btn-warning form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Disable Record') }}</td>
                  {% else %}
                    <td>{{ link_to('record/disable/' ~ domain.id ~ '/' ~ record.id,'<i class="fas fa-check"></i>','class':'btn btn-success form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Enable Record') }}</td>
                  {% endif %}
                  <td>{{ link_to('record/delete/' ~ domain.id ~ '/' ~ record.id,'<i class="fas fa-trash"></i>','class':'btn btn-danger form-control','data-toggle': 'tooltip', 'data-placement': 'bottom', 'title': 'Delete Record') }}</td>
                {% else %}
                  <td colspan="4"></td>
                {% endif %}
                </tr>
        {% if loop.last %}
              </tbody>
            </table>
          </div>
        </div>
        {% endif %}
        {% endfor %}
        {% if records.next  > 1 %}
          <div class="row">
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-double-left"></i> First</button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <input type="hidden" name="page" value="{{ records.before }}">
                <button type="submit" class="btn btn-primary form-control"><i class="fas fa-angle-left"></i> Previous</button>
              </form>
            </div>
            <div class="col-lg-4">
              <p class="form-control">{{ records.current }}/{{ records.total_pages }}</p>
            </div>
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <input type="hidden" name="page" value="{{ records.next }}">
                <button type="submit" class="btn btn-primary form-control">Next <i class="fas fa-angle-right"></i></button>
              </form>
            </div>
            <div class="col-lg-2">
              {{ form('record/index/' ~ domain.id ~ '/') }}
                <input type="hidden" name="page" value="{{ records.last }}">
                <button type="submit" class="btn btn-primary form-control">Last <i class="fas fa-angle-double-right"></i></button>
              </form>
            </div>
          </div>
        {% endif %}
      </div>
    </div>
  </div>
</div>

<!-- START TTL MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="ttl_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="far fa-calendar-check"></i> Edit TTL and Priority of Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <form method="post" action="{{ url('record/update/' ~ domain.id) }}">
        <input type="hidden" name="record_id" value="" id="ttl_modal_record_id">
        <div class="modal-body">
          <div class="row">
            <div class="col-lg-12">
              <p>The <b>T</b>ime <b>t</b>o <b>L</b>ive describes how long the record should stay in the cache. This affects the update time of the domain.</p>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">TTL (sec)</span>
                </div>
                <input type="number" name="ttl" class="form-control" placeholder="3600" id="ttl_modal_ttl">
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
              <p>The priority of the target host, lower value means more preferred.</p>
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Priority</span>
                </div>
                <input type="number" name="prio" class="form-control" placeholder="0" id="ttl_modal_prio">
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-primary form-control"><i class="fas fa-save"></i> Save</button>
        </div>
      </form>
    </div>
  </div>
</div>
<!-- END TTL MODAL -->
<!-- START EDIT MODAL -->
<div class="modal" tabindex="-1" role="dialog" id="edit_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Modal body text goes here.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
<!-- END EDIT MODAL -->
