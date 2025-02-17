<template>
    <div class="container">
        <div class="wrap">
            <div class="modal accent">
                <h3 class="main-element rel-position normal-element header">{{ title }}</h3>
                <form class="dialog-form" @submit.prevent>
                    <input class="main-element n-font clickible rel-position form-el" id="dialogInput"
                        :type="input?.type ? input.type : 'hidden'" :placeholder="input?.placeholder" required v-model="inputVal">
                    <button class="main-element n-font clickible rel-position form-el" type="submit"
                        @click="DialogSubmit('submit')" autofocus>{{ submitTitle }}</button>
                    <button class="main-element n-font clickible rel-position form-el" type="submit" v-if="closeTitle"
                        @click="DialogSubmit('close')">{{ closeTitle }}</button>
                </form>
            </div>
        </div>
    </div>
</template>

<script setup lang="ts">
    import type { DialogInput } from '@/types';
    import type { PropType } from 'vue';

    const props = defineProps({
        title: { type: String, required: true },
        input: { type: Object as PropType<DialogInput>, required: false },
        submitTitle: { type: String, required: true },
        closeTitle: { type: String, required: false }
    });
    const emit = defineEmits(['submit']);
    const inputVal = ref('');

    function DialogSubmit(type: 'close' | 'submit'): void {
        emit('submit', type, inputVal.value); 
    };
</script>

<style scoped lang="scss">
.container {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    overflow: auto;
    background: #fff3;
    z-index: 1;

    &>.wrap {
        padding: 20px;
        min-height: 100%;
        display: flex;
        align-items: center;
        justify-content: center;
        box-sizing: border-box;

        &>.modal {
            width: 500px;
            max-width: 100%;
            border: none;
            border-radius: 10px;
        }
    }
}

.form-el {
    width: 50%;
    height: fit-content;
    margin-bottom: 5%;
}

.dialog-form {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
}

.header {
    width: 100%;
    height: fit-content;
    margin-bottom: 10%;
}
</style>