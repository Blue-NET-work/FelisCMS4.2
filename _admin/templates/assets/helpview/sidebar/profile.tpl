        <!-- Profile
        ================================================== -->
        <section id="profile">
            <div class="row">
                <div class="col-md-3 col-sm-3 thumbnail"><img src="{$userLogIn.avatar}" class="user-icon img-rounded" alt="avatar"></div>
                <div class="col-md-9 col-sm-9">
                    {lang line="default_sidebar_menu_hello"},
                    <span class="name">{$userLogIn.first_name} <b>{$userLogIn.last_name}</b></span>
                    <span class="profileUprawnienia">{lang line="default_sidebar_menu_permissions"}: {$userLogIn.high}</span>
                </div>
            </div>
        </section>    
                       