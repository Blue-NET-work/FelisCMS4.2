{extends file="assets/helpview/_Layout.tpl"}

{block name="head"}
	<title>Urloping</title>
{/block}

{block name="content"}
        	<div class="panel panel-default panel-green margin-top-20">
              <div class="panel-heading"><i class="fa fa-sign-in"></i> Logowanie</div>
              <div class="panel-body text-center">

{include file="assets/helpview/messages.tpl" messages=$messages}

	              <div class="row margin-top-20">
                  	<div class="col-md-4"></div>
                  	<div class="col-md-4">
	                    <form class="form-horizontal" id="logowanie" action="{$base_url}zaloguj.html" role="form" method="POST">
	                      <div class="form-group">
	                        <label for="inputEmail3" class="col-sm-4 control-label">Login</label>
	                        <div class="col-sm-8">
	                          <input type="text" name="item[login]" class="form-control" id="inputEmail3" placeholder="Nazwa użytkownika">
	                        </div>
	                      </div>
	                      <div class="form-group">
	                        <label for="inputPassword3" class="col-sm-4 control-label">Hasło</label>
	                        <div class="col-sm-8">
	                          <input type="password" name="item[password]" class="form-control" id="inputPassword3" placeholder="Hasło">
	                        </div>
	                      </div>
	                      <div class="form-group">
	                        <div class="col-sm-offset-4 col-sm-8">
	                          <button type="submit" class="btn btn-default">Zaloguj się</button>
	                        </div>
	                      </div>
	                    </form>
                  	</div>
                  	<div class="col-md-4"></div>
	              </div>
              </div>
            </div>

{/block}