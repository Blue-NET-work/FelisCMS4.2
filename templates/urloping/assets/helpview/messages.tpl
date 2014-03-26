    {if $messages}
        <section id="alert" class="margin-top-20 margin-bottom-20">
            <div class="alert {$messages.boxClass}">
              <a href="#" class="close" data-dismiss="alert">×</a>
              <i class="{$messages.icon}"></i>
              {$messages.text}
            </div>
        </section>
    {/if}