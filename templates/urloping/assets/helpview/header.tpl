
	<header>
    	<div class="container">
        	<div class="row margin-bottom-10">
            	<!-- logo -->
            	<div class="col-md-4">
                	<a id="logo" href="#"><img src="{$TEMPLATES}assets/img/logo.png" alt=""></a>
                </div>
            	<!-- ./logo -->
            	<!-- szukaj -->
                <div class="col-md-5">
                    <div class="czasUrlop">
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
                <div class="col-md-3">
                    <form class="form-horizontal" role="form">
                      <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">Użytkownik</label>
                        <div class="col-sm-10">
                          <input type="email" class="form-control" id="inputEmail3" placeholder="Email">
                        </div>
                      </div>
                      <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">Hasło</label>
                        <div class="col-sm-10">
                          <input type="password" class="form-control" id="inputPassword3" placeholder="Password">
                        </div>
                      </div>
                      <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-10">
                          <button type="submit" class="btn btn-default">Sign in</button>
                        </div>
                      </div>
                    </form>
                </div>
            	<!-- ./logowanie -->
            </div>
			<!-- nav -->
            <nav>
            	<ul class="list-unstyled list-inline">
                	<li><a href="#">Obiekty</a></li>
                    <li><a href="#">Okolicznościowe</a></li>
                    <li><a href="#">Oferta tygodnia</a></li>
                    <li><a href="#">Nagrody</a></li>
                    <li><a href="#">Pogoda</a></li>
                    <li><a href="#">Jak to działa</a></li>
                    <li><a href="#">O Nas</a></li>
                    <li><a href="#">Kontakt</a></li>
                </ul>
            </nav>
			<!-- ./nav -->
        </div>
    </header>
	<!-- ./header -->