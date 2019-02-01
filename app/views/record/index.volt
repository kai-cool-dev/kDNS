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
          <div class="col-lg-4">
            {{ link_to('domain/edit/' ~ domain.id, '<i class="fas fa-angle-left"></i> Back', 'class':'form-control btn btn-primary') }}
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
                  <form method="post" id="create_form" action="{{ url('record/create/' ~ domain.id) }}">
                    <td>
                      <div class="input-group">
                        {{ new_record.render('name') }}
                        <div class="input-group-append">
                          <span class="input-group-text"><span id="dot"></span>{{ domain.name }}</span>
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
                  <input type="hidden" id="domain_{{ record.id }}" value="{{ domain.name }}">
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
<div class="modal fade" tabindex="-1" role="dialog" id="edit_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fas fa-edit"></i> Edit Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form method="post" action="{{ url('record/update/' ~ domain.id) }}">
        <input type="hidden" name="record_id" value="" id="edit_modal_record_id">
        <div class="modal-body">
          <div class="row">
            <div class="col-lg-12">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Name</span>
                </div>
                <input type="text" name="name" class="form-control" placeholder="" id="edit_modal_name">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <div class="input-group">
                <div class="input-group-prepend">
                  <span class="input-group-text">Content</span>
                </div>
                <input type="text" name="content" class="form-control" placeholder="" id="edit_modal_content">
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
<!-- END EDIT MODAL -->
<!-- START SPF MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="spf_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="far fa-envelope"></i> Create SPF Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p><b>S</b>ender <b>P</b>olicy <b>F</b>ramework is an email authentication method designed to detect forged sender addresses in emails (email spoofing), a technique often used in phishing and email spam.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="spf_a_record" id="spf_a_record">
                </div>
              </div>
              <p class="form-control"><label for="spf_a_record">Allow A-Record origin to send mails?</label></p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="spf_mx_record" id="spf_mx_record">
                </div>
              </div>
              <p class="form-control"><label for="spf_mx_record">Allow MX-Record origin to send mails?</label></p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="spf_ptr_record" id="spf_ptr_record">
                </div>
              </div>
              <p class="form-control"><label for="spf_ptr_record">Allow subdomains to send mails?</label></p>
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
            <button class="btn btn-primary form-control" type="button" data-toggle="collapse" data-target="#spf_collapse" aria-expanded="false" aria-controls="spf_collapse">Show advanced options</button>
          </div>
        </div>
        <div class="collapse" id="spf_collapse">
          <div class="row">
            <div class="col-lg-12">
              <p>Additional IPv4 addresses (comma seperated)</p>
              <input type="text" name="spf_ip4" class="form-control" placeholder="127.0.0.1" id="spf_ip4">
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <hr>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <p>Additional IPv6 addresses (comma seperated)</p>
              <input type="text" name="spf_ip6" class="form-control" placeholder="fe80::1" id="spf_ip6">
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <hr>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <p>Additional A-Record origins (comma seperated)</p>
              <input type="text" name="spf_a" class="form-control" placeholder="webserver.myserver.com" id="spf_a">
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <hr>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <p>Additional MX-Record origins (comma seperated)</p>
              <input type="text" name="spf_mx" class="form-control" placeholder="mail.myserver.com" id="spf_mx">
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <hr>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <p>Additional SPF includes (comma seperated)</p>
              <input type="text" name="spf_include" class="form-control" placeholder="mail.myserver.com" id="spf_include">
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
            <p>How should the mails handled?</p>
            <select class="form-control" name="spf_blocked" id="spf_blocked">
              <option value="fail">Fail (Mails will be blocked)</option>
              <option value="softfail" selected>SoftFail (Mails will not be blocked, but marked)</option>
              <option value="neutral">Neutral (Do nothing)</option>
            </select>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="spf_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END SPF MODAL -->
<!-- START CAA MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="caa_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fas fa-certificate"></i> Create CAA Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p>A <b>C</b>ertification <b>A</b>uthority <b>A</b>uthorization record is used to specify which certificate authorities (CAs) are allowed to issue certificates for a domain.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">
                  <input type="checkbox" name="caa_wildcard" id="caa_wildcard">
                </div>
              </div>
              <p class="form-control"><label for="caa_wildcard">Wildcard certificate</label></p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Issuer</div>
              </div>
              <input type="text" name="caa_issuer" id="caa_issuer" class="form-control">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="caa_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END CAA MODAL -->
<!-- START SRV MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="srv_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fab fa-osi"></i> Create SRV Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p>A <b>S</b>ervice <b>R</b>esource <b>R</b>ecord is a specification of data in the Domain Name System defining the location, i.e. the hostname and port number, of servers for specified services.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Service</div>
              </div>
              <input type="text" name="srv_service" id="srv_service" class="form-control">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Protocol</div>
              </div>
              <select type="text" name="srv_protocol" id="srv_protocol" class="form-control">
                <option value="_udp" selected>UDP</option>
                <option value="_tcp">TCP</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Weight</div>
              </div>
              <input type="number" name="srv_weight" id="srv_weight" class="form-control" value="0">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Port</div>
              </div>
              <input type="number" name="srv_port" id="srv_port" class="form-control" min="1" max="65535">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Target</div>
              </div>
              <input type="text" name="srv_target" id="srv_target" class="form-control">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="srv_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END SRV MODAL -->
<!-- START SSHFP MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="sshfp_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fas fa-fingerprint"></i> Create SSHFP Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p>A <b>S</b>ecure <b>S</b>hell <b>f</b>inger<b>p</b>rint record is a type of resource record in the Domain Name System (DNS) which identifies SSH keys that are associated with a host name.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Algorithm</div>
              </div>
              <select type="text" name="sshfp_algo" id="sshfp_algo" class="form-control">
                <option value="1">RSA</option>
                <option value="2">DSA</option>
                <option value="3" selected>ECDSA</option>
                <option value="4">Ed25519</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Type</div>
              </div>
              <select type="text" name="sshfp_type" id="sshfp_type" class="form-control">
                <option value="1">SHA-1</option>
                <option value="2" selected>SHA-256</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Fingerprint</div>
              </div>
              <input type="text" name="sshfp_fingerprint" id="sshfp_fingerprint" class="form-control">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="sshfp_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END SSHFP MODAL -->
<!-- START DKIM MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="dkim_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fas fa-signature"></i> Create DKIM Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p><b>D</b>omain <b>K</b>eys <b>I</b>dentified <b>M</b>ail helps you protect your company from email spamming and phishing attempts. It provides a method for validating a domain name identity that is associated with a message through cryptographic authentication.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Selector</div>
              </div>
              <input type="text" name="dkim_selector" id="dkim_selector" class="form-control" value="default" placeholder="default">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Public-Key</div>
              </div>
              <input type="text" name="dkim_key" id="dkim_key" class="form-control" placeholder="MiIIXXg[...]+GXT">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="dkim_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END DKIM MODAL -->
<!-- START AFSDB  MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="afsdb_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fas fa-database"></i> Create AFSDB Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p>Map a domain name to an <b>A</b>ndrew <b>F</b>ile <b>S</b>ystem <b>d</b>atabase <b>s</b>erver.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Type</div>
              </div>
              <select type="text" name="afsdb_type" id="afsdb_type" class="form-control">
                <option value="1" selected>AFS Volume Location Server</option>
                <option value="2">DCE Authentication Server</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Hostname</div>
              </div>
              <input type="text" name="afsdb_hostname" id="afsdb_hostname" class="form-control">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="afsdb_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END AFSDB  MODAL -->
<!-- START DNSKEY  MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="dnskey_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fas fa-key"></i> Create DNSKEY Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p>A DNSKEY-record holds a public key that resolvers can use to verify DNSSEC signatures in RRSIG-records.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Flags</div>
              </div>
              <select type="text" name="dnskey_flags" id="dnskey_flags" class="form-control">
                <option value="256" selected>Zonesign</option>
                <option value="257">Keysign</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Protocol</div>
              </div>
              <select type="text" name="dnskey_protocol" id="dnskey_protocol" class="form-control">
                <option value="1" selected>TLS</option>
                <option value="2">eMail</option>
                <option value="3">DNSSEC</option>
                <option value="4">IPsec</option>
                <option value="255">All</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Algorithm</div>
              </div>
              <select type="text" name="dnskey_algo" id="dnskey_algo" class="form-control">
                <option value="1">RSA/MD5</option>
                <option value="2">Diffie Hellman</option>
                <option value="3">DSA/SHA-1</option>
                <option value="4">ECC</option>
                <option value="5">RSA/SHA-1</option>
                <option value="6">DSA/SHA-1/NSEC3</option>
                <option value="7">RSA/SHA-1/NSEC3</option>
                <option value="8">RSA/SHA-256</option>
                <option value="10">RSA/SHA-512</option>
                <option value="12">ECC-GOST</option>
                <option value="13" selected>ECDSA/Curve P-256/SHA-256</option>
                <option value="14">ECDSA/Curve P-384/SHA-384</option>
              </select>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">Key</div>
              </div>
              <input type="text" name="dnskey_key" id="dnskey_key" class="form-control">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="dnskey_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END DNSKEY  MODAL -->
<!-- START SMIMEA MODAL -->
<div class="modal fade" tabindex="-1" role="dialog" id="smimea_modal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title"><i class="fas fa-key"></i> Create SMIMEA Record</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true"><i class="fas fa-times"></i></span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-12">
            <p>Using secure DNS to associate certificates with Domain Names for S/MIME.</p>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">E-Mail-Address</div>
              </div>
              <input type="text" name="smimea_mail" id="smimea_mail" class="form-control">
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <div class="input-group">
              <div class="input-group-prepend">
                <div class="input-group-text">S/MIME Certificate</div>
              </div>
              <input type="text" name="smimea_cert" id="smimea_cert" class="form-control">
            </div>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button class="btn btn-primary form-control" id="smimea_save"><i class="fas fa-save"></i> Save</button>
      </div>
    </div>
  </div>
</div>
<!-- END SMIMEA MODAL -->
