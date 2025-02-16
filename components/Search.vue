<template>
    <h3 class="main-element rel-position normal-element">Search For Items</h3>
    <h4 class="main-element rel-position normal-element">To search for an item, type its code in the search box below. Then click "Jump To Item" to view it in the all items section.</h4>
    <div class="rel-position" id="input-contaner">
        <input type="text" class="main-element rel-position clickible n-font" id="query" placeholder="Item Code" v-model="query">
    </div>
    <div class="main-element rel-position normal-element result" v-if="query in items">
        <p class="main-element rel-position normal-element n-font">{{ items[query] }}</p>
        <button class="main-element rel-position clickible n-font" type="button" @click="Jump()">Jump To Item {{ query }}</button>
    </div>
    <p class="main-element rel-position normal-element n-font result" v-else-if="query === ''">Start Searching To Find An Item</p>
    <p class="main-element rel-position normal-element n-font result" v-else>Item Not Found</p>
</template>

<script setup lang="ts">
    import { ref } from 'vue';
    import type { PropType } from 'vue';
    import type { Items } from '~/types';
    
    const query = ref('');
    const props = defineProps({
        items: {type: Object as PropType<Items>, required: true}
    }); 

    function Jump() {
        document.getElementById(query.value)?.scrollIntoView({
            behavior: 'smooth',
        });
    };
</script>

<style scoped>
    .result {
        width: 100%;
    }

    #input-contaner {
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 5%;
        margin-bottom: 5%;
    }

    #query {
        width: 30%;
    }
</style>