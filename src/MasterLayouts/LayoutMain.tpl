<div class="mLayout layoutMain state1" id="mLayout">

	<$MasterLayouts/ResponsiveScript()$>

	<$if (!PageModel.IsWidgetMode)$>

		<!-- header zone -->
		<div class="zoneHeader1">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header"$>
				</div>
			</div>
		</div>
		<div class="zoneHeader2">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header1"$>
				</div>
			</div>
		</div>
		<div class="zoneHeader3">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header2"$>
				</div>
			</div>
		</div>
		<div class="zoneHeader4">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Header3"$>
				</div>
			</div>
		</div>
		<!-- /header zone -->

	<$endif$>

	<!-- content zone -->
	<div class="zoneContent">
		<div class="container_12">
			<div class="s1_grid_12 s2_grid_12 s3_grid_12">
				<$Area Name="Content"$>
			</div>
		</div>
	</div>
	<!-- /content zone -->

	<$if (!PageModel.IsWidgetMode)$>

		<!-- footer zone -->
		<div class="zoneFooter1">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Footer"$>
				</div>
			</div>
		</div>
		<div class="zoneFooter2">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Footer1"$>
				</div>
			</div>
		</div>
		<div class="zoneFooter3">
			<div class="container_12">
				<div class="s1_grid_12 s2_grid_12 s3_grid_12">
					<$Area Name="Footer2"$>
				</div>
				<$if (!PageModel.ShowFreeAccountAds)$>
					<div class="s1_grid_12 s2_grid_12 s3_grid_12">
						<$MasterLayouts/WAbranding()$>
					</div>
				<$endif$>
			</div>
		</div>
		<!-- /footer zone -->

	<$endif$>

	<$if (PageModel.GlobalUserJavaScript)$>
		<div id="idCustomJsContainer" class="cnCustomJsContainer">
			<$PageModel.GlobalUserJavaScript$>
		</div>
	<$endif$>

	<$if (PageModel.ShowFreeAccountAds)$>
		<$MasterLayouts/FreeAccountTracker()$>
		<$if (PageModel.IsAnonymousView || PageModel.IsMemberView)$>
			<div class="WABannerStickyBottomSpacer"></div>
			<div class="WABannerStickyBottom">
				<div class="container_12">
					<div class="s1_grid_12 s2_grid_12 s3_grid_12">
						<div class="WABannerTable">
							<div class="WABannerTh">Powered by <a class="WABannerLink" href="http://www.wildapricot.com?from=footer_banner_mvp_1&utm_campaign=free-account-footer" target="_blank">Wild Apricot</a>. Try our all-in-one platform for easy membership management</div>
							<div class="WABannerTd"><a class="WABannerButton" href="http://www.wildapricot.com?from=footer_banner_mvp_1&utm_campaign=free-account-footer" target="_blank">Try it FREE</a></div>
						</div>
					</div>
				</div>
			</div>
			<script>
				var WABannerStickyBottom = true;
			</script>
		<$endif$>
	<$endif$>

</div>