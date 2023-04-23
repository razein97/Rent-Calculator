<script>
	/**
	 * @type {any}
	 */
	export let postData;
</script>

<div class="h-3/4 w-full  p-8">
	<div class="w-full">
		<hr class="h-1 bg-black" />
		<div class="w-1/4 bg-black p-2 text-center text-sm font-bold text-white">
			TODAY'S TOP ARTICLES
		</div>
	</div>
	<br />

	<div class="flex flex-row gap-x-10">
		{#each postData.postData as article}
			{#if article.id == 1}
				<div class="flex w-9/12 flex-col gap-y-3  ">
					<img class="h-3/5 w-full" src="https://via.placeholder.com/480" alt="" />
					<p class="font-xs   text-sm  font-semibold uppercase hover:cursor-pointer">Tag, tag</p>
					<a href="/" class=" text-3xl font-black uppercase tracking-tighter">{article.title}</a>
					<a href="/" class=" text-sm font-bold uppercase">Author: {article.userId}</a>
				</div>
			{/if}
		{/each}

		<div class="w-1/4 ">
			<div class="flex flex-col gap-y-6">
				{#each postData.postData as article}
					{#if article.id != 1}
						<div class="flex h-1/2 flex-col gap-y-3">
							<img class="h-3/5 w-full" src="https://via.placeholder.com/255" alt="" />
							<p class="font-xs   text-sm  font-semibold uppercase hover:cursor-pointer">
								tag 2, tag 3
							</p>
							<a href="/" class="  text-lg font-bold">{article.title}</a>
							<a href="/" class="  text-sm font-bold">Author: {article.userId}</a>
						</div>
					{/if}
				{/each}
			</div>
		</div>
	</div>
</div>
