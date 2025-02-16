<template>
    <h3 class="main-element rel-position normal-element">Add An Item</h3>
    <h4 class="main-element rel-position normal-element">To add an item, type a new code and descriptipn in the boxes below. Then click "Add" to add the item.</h4>
    <form @submit.prevent="Add" class="rel-position" id="add-form">
        <input type="number" class="main-element rel-position clickible n-font form-element" required placeholder="New Item Code" v-model="code">
        <input type="text" class="main-element rel-position clickible n-font form-element" required placeholder="New Item Description" v-model="description">
        <button class="main-element rel-position clickible n-font form-element" type="submit">Add</button>
    </form>
</template>

<script setup lang="ts">
    import { ref, type PropType } from 'vue';
    import type { Items, ModalAssign } from '~/types';
    import { assign } from 'lodash';

    const code = ref('');
    const description = ref('');
    const props = defineProps({
        items: {type: Object as PropType<Items>, required: true},
        modal: {type: Function as PropType<ModalAssign>, required: true}
    });

    function Add() { // Adds an item
        if(code.value in props.items) {
            props.modal({ // Ask if the user wants to override the item if it already exists
                title: `Item ${code.value} already exists, are you sure you want to replace it?`,
                submitTitle: "Yes",
                closeTitle: "No",
                action: (type) => {
                    if(type === 'submit') {
                        FinalizeAdd();
                    }; 
                }
            }); 
        } else {
            FinalizeAdd();
        };
    };

    function FinalizeAdd() { // Function to actualy add the item
        assign(props.items, {[code.value]:description.value});
        localStorage.setItem('items', JSON.stringify(props.items));
        document.getElementsByTagName('form')[0].reset();
    };
</script>

<style scoped>
    .form-element {
        width: 25%;
        margin-top: 2%;
        margin-bottom: 2%;
    }

    #add-form {
        width: 100%;
        display: flex;
        flex-direction: column;
        align-items: center;
    }
</style>