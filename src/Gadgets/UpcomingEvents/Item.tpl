<li<$if (it.IsLastItem)$> class="last"<$else$><$endif$>>
	<div class="title"><a href="<$it.Url$>"><$it.Title$></a></div>
	<div class="date">
		<span class="dateonly" client-tz-item="<$it.EventTimeZone$>" client-tz-formatted="<$it.FormattedEventTimeZone$>"><$it.EventDate$></span>
		<span class="separator">&#8226;</span>
		<span class="location"><$it.Location$></span>
	</div>
</li>
