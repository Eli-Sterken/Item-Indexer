<template>
    <div class="box rel-position accent">
            <h3 class="main-element rel-position header">Search For An Item</h3>
            <h4 class="main-element rel-position header">To search for an item, enter it's code below:</h4>
            <div class="rel-position inputContaner">
                    <input class="main-element clickible n-font rel-position input firstInput" type="number" placeholder="Item Code" v-model="query">
            </div>
            <p class="rel-position main-element header n-font">
                <div v-if="query in items">
                    <span class="main-element">{{ items[query] }}  -  </span>
                    <button class="main-element n-font rel-position clickible" id="resultDelete" @click="Jump(query)">Jump To Item {{ query }}</button>
                </div>
                <span v-else-if="query === ''">Start searching to find an item! (Don't froget that search only activates when you type numbers)</span>
                <span v-else>Item Not Found (Make sure you're searching for the code, and not the description!)</span>
            </p>
        </div>
</template>

<script setup lang="ts">
    import { defineComponent, reactive, ref} from 'vue';
    
    const query = ref('');
    const props = defineProps({
        items: {type: Object, required: true}
    });

    props.items.value = {'0':'Test'};

    function Jump(item:string) {
        document.getElementById(item)?.scrollIntoView({
            behavior: "smooth"
        });
    };
</script>

<style scoped>
    #resultDelete {
        background-color: #0b579e;
    }
</style>