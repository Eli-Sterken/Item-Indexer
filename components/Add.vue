<template>
    <div class="box rel-position accent">
        <h3 class="main-element rel-position header">Add An Item</h3>
        <h4 class="main-element rel-position header">To add an item, enter a new code and description below, and then
            click "Add"!</h4>
        <form class="rel-position inputContaner" @submit.prevent="add">
            <input class="main-element rel-position n-font input clickible firstInput" type="number"
                placeholder="New Item Code" v-model="newCode" required>
            <input class="main-element rel-position n-font input clickible" type="text"
                placeholder="New Item Discription" v-model="newDisc" required>
            <button class="main-element rel-position n-font input clickible" type="submit">Add</button>
        </form>
        <p class="main-element rel-position input n-font" id="addWarning">Please note - While you can add an item with a
            code that is not a number, you can not search for it.</p>
    </div>
</template>

<script setup lang="ts">
import type { ModalAssign } from '@/types';
import { assign } from 'lodash';
import { ref, type PropType } from 'vue';

const props = defineProps({
    items: { type: Object, required: true },
    modal: {
        type: Function as PropType<ModalAssign>,
        required: true
    }
});
const newCode = ref('');
const newDisc = ref('');

function FinalizeAdd() {
    assign(props.items, { [newCode.value]: newDisc.value });
    delete props.items.value;
    localStorage.setItem('items', JSON.stringify(props.items));
    newCode.value = '';
    newDisc.value = '';
};

function add(): void { // Function to add an item
    if(newCode.value in props.items) {
        props.modal({
            title: `Item ${newCode.value} already exists, do you want to replace it?`,
            submitTitle: 'Yes',
            closeTitle: 'No',
            action: (type) => {
                if(type === 'submit') {
                    FinalizeAdd();
                }
            }
        });
    } else {
        FinalizeAdd();
    }
    
};
</script>

<style scoped>
#addWarning {
    width: 100%;
}
</style>