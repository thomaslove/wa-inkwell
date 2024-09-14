﻿<div class="menuBackground"></div>
<div class="menuInner">
	<ul class="firstLevel">
		<$Model.Items:Item()$>
	</ul>
</div>

<script type="text/javascript">
	jq$(function()
	{
		var gadgetHorMenu = jq$('#<$Model.Id$>'),
			gadgetHorMenuContainer = gadgetHorMenu.find('.menuInner'),
			firstLevelMenu = gadgetHorMenu.find('ul.firstLevel'),
			holderInitialMenu = firstLevelMenu.children(),
			outsideItems = null,
			phantomElement = '<li class="phantom"><div class="item"><a href="#"><span>&#x2261;</span></a><ul class="secondLevel"></ul></div></li>',
			placeHolder = gadgetHorMenu.parents('.WaLayoutPlaceHolder'),
			placeHolderId = placeHolder && placeHolder.attr('data-componentId'),
			mobileState = false,
			rsStateWidth2 = 617,
			isTouchSupported = !!(('ontouchstart' in window) || (window.DocumentTouch && document instanceof DocumentTouch) || (navigator.msPointerEnabled && navigator.msMaxTouchPoints));


		function resizeMenu()
		{
			var i,
				len,
				fitMenuWidth = 0,
				menuItemPhantomWidth = 80;

			// background track
			gadgetHorMenu.find('.menuBackground').css(
			{
				'width': jq$('body').width(),
				'left': ( ( jq$('body').width() - gadgetHorMenu.width() ) * -0.5 )
			});

			firstLevelMenu.html( holderInitialMenu).removeClass('adapted').css({ width: 'auto' }); // restore initial menu

			if( !gadgetHorMenuContainer.find('.menuButton').size() )
			{
				gadgetHorMenuContainer.prepend('<div class="menuButton"></div>');

				gadgetHorMenuContainer.find('.menuButton').on("click",function()
				{
					gadgetHorMenuContainer.find('ul.firstLevel').toggle();
					return false;
				});

				jq$('body').on("click",function()
				{
					if( mobileState )
						gadgetHorMenuContainer.find('ul.firstLevel').hide();
				});
			}

			// for state 3
			if( jq$(window).width() < rsStateWidth2 && mobileState == false )
			{
				gadgetHorMenuContainer.find('ul.firstLevel').attr('style','');
				mobileState = true;

				return false;
			}

			if( jq$(window).width() >= rsStateWidth2 )
			{
				gadgetHorMenuContainer.find('ul.firstLevel').attr('style','');
				mobileState = false;
			}


			if( firstLevelMenu.width() > gadgetHorMenuContainer.width() ) // if menu oversize
			{
				menuItemPhantomWidth = firstLevelMenu.addClass('adapted').append( phantomElement).children('.phantom').width();

				for( i = 0, len = holderInitialMenu.size(); i <= len; i++ )
				{
					fitMenuWidth += jq$( holderInitialMenu.get(i) ).width();

					if( fitMenuWidth + menuItemPhantomWidth > gadgetHorMenuContainer.width() )
					{
						outsideItems = firstLevelMenu.children(':gt('+(i-1)+'):not(.phantom)').remove();
						firstLevelMenu.find('.phantom > .item > ul').append( outsideItems);
						break;
					}
				}
				gadgetHorMenu.find('.phantom > .item > a').click(function(){ return false; });
			}

			disableFirstTouch();

			firstLevelMenu.css( 'width', '' ); // restore initial menu width
			firstLevelMenu.children().removeClass('last-child').eq(-1).addClass('last-child'); // add last-child mark
		}

		resizeMenu();

		jq$(window).resize(function()
		{
			resizeMenu();
		});

		jq$(window).load(function(){
			resizeMenu();
		});

		function onLayoutColumnResized(sender, args)
		{
			args = args || {};

			if (placeHolderId && (placeHolderId == args.leftColPlaceHolderId || placeHolderId == args.rightColPlaceHolderId))
			{
				resizeMenu();
			}
		}

		BonaPage.addPageStateHandler(BonaPage.PAGE_PARSED, function() { WA.Gadgets.LayoutColumnResized.addHandler(onLayoutColumnResized); });
		BonaPage.addPageStateHandler(BonaPage.PAGE_UNLOADED, function() { WA.Gadgets.LayoutColumnResized.removeHandler(onLayoutColumnResized); });


        function disableFirstTouch()
        {
          if (!isTouchSupported) return;


          jq$('#<$Model.Id$>').find('.menuInner li.dir > .item > a').on( 'click', function(event)
          {
            if( !this.touchCounter )
              this.touchCounter = 0;

            if( this.touchCounter >= 1 )
            {
              this.touchCounter = 0;
              return true;
            }
            this.touchCounter++;

            if (!mobileState)
            {
              WA.stopEventDefault(event);
            }
          });

          jq$('#<$Model.Id$>').find('.menuInner li.dir > .item > a').on( 'mouseout', function(event)
          {
            if( !this.touchCounter )
              this.touchCounter = 0;
            this.touchCounter = 0;
          });
        }

        disableFirstTouch();

	});
</script>