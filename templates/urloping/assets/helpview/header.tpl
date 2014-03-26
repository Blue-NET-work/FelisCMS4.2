
	<header>
    	<div class="container">
        	<div class="row margin-bottom-10">
            	<!-- logo -->
            	<div class="col-md-4">
                	<a id="logo" href="{$base_url}"><img src="{$TEMPLATES}assets/img/logo.png" alt=""></a>
                </div>
            	<!-- ./logo -->
            	<!-- szukaj -->
                <div class="col-md-5">
                    <div class="czasUrlop margin-top-40">
                        <form class="form-inline" role="form">
                          <div class="form-group">
                            <select class="form-control" name="region" id="region">
                                <option value="0" selected="selected">region</option>
                                <option value="2">Północ</option>
                                <option value="3">Góry</option>
                                <option value="4">Wschód</option>
                                <option value="5">Zachód</option>
                                <option value="6">Centrum</option>
                            </select>
                          </div>
                          <div class="form-group">
                            <select class="form-control" name="time" id="time">
                                <option value="0" selected="selected">czas</option>
                                <option value="3">3 dni</option>
                                <option value="4">4 dni</option>
                                <option value="5">5 dni</option>
                                <option value="6">6 dni</option>
                                <option value="7">7 dni</option>
                                <option value="8">8 dni</option>
                                <option value="9">9 dni</option>
                                <option value="10">10+ dni</option>
                            </select>
                          </div>
                          <button type="submit" class="btn btn-default">ZNAJDŹ</button>
                        </form>
                    </div>
                </div>
            	<!-- ./szukaj -->
            	<!-- logowanie -->
                <div class="col-md-3 text-right">
                {if $userLogIn}
                <div class="padding-20 margin-top-10 margin-bottom-30 no-left-padding no-right-padding">
                    <p>{$userLogIn.first_name} <b>{$userLogIn.last_name}</b></p>
                    <a href="{$base_url}panel.html">Moje Konto</a>
                    <a href="{$base_url}wyloguj.html">wyloguj</a>
                </div>
                {else}
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
                        <div class="col-sm-offset-3 col-sm-9">
                          <a href="{$base_url}rejestracja.html" class="btn btn-default">Rejestracja</a>
                          <button type="submit" class="btn btn-default">Zaloguj się</button>
                        </div>
                      </div>
                    </form>
                {/if}
                </div>
            	<!-- ./logowanie -->
            </div>
			<!-- nav -->
            <nav>
            	<ul class="list-unstyled list-inline">
                	<li {if $uri[0] == "hotele"}class="active"{/if}><a href="{$base_url}hotele.html">Obiekty</a></li>
                    <li {if $uri[0] == "okolicznosciowe"}class="active"{/if}><a href="{$base_url}okolicznosciowe.html">Okolicznościowe</a></li>
                    <li {if $uri[0] == "oferta_tygodnia"}class="active"{/if}><a href="{$base_url}oferta_tygodnia.html">Oferta tygodnia</a></li>
                    <li class="dropdown {if $uri[0] == "nagrody"}active{/if}">
                    	<a href="{$base_url}nagrody.html" class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">Nagrody</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1" href="{$base_url}koszyk.html" title="koszyk">koszyk</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="{$base_url}panel.html" title="moje konto">moje konto</a></li>
						</ul>
                    </li>
                    <li {if $uri[0] == "pogoda"}class="active"{/if}><a href="{$base_url}pogoda.html">Pogoda</a></li>
                    <li class="dropdown {if $uri[0] == "jak-to-dziala"}active{/if}">
                    	<a href="{$base_url}jak-to-dziala.html" class="dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown">Jak to działa</a>
						<ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
							<li role="presentation"><a role="menuitem" tabindex="-1" href="{$base_url}znajdz-i-zarezerwuj.html" title="Znajdź i zarezerwuj">znajdź i zarezerwuj</a></li>
							<li role="presentation"><a role="menuitem" tabindex="-1" href="{$base_url}" title="co z tymi nagrodami?">co z tymi nagrodami?</a></li>
						</ul>
                    </li>
                    <li {if $uri[0] == "o-nas"}class="active"{/if}><a href="{$base_url}o-nas.html">O Nas</a></li>
                    <li {if $uri[0] == "kontakt"}class="active"{/if}><a href="{$base_url}kontakt.html">Kontakt</a></li>
                </ul>
            </nav>
			<!-- ./nav -->
        </div>
    </header>
	<!-- ./header -->