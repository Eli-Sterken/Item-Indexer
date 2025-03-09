<template>
    <div id="blurr">
        <div class="main-element rel-position accent" id="savemisty">
            <h1 class="main-element rel-position normal-element">Help Save Misty</h1>
            <p class="main-element rel-position normal-element n-font savee">
                Me and my family's kitten, Misty, accedintaly swolowed a piece of plastic, and it got stuck in her small intensine.<br>She needed a life saving surgery to remove it, and its currently recovering now.<br>If you are able to help support the surgery via GoFundMe, that would be much appreciated!
            </p>
            <button class="main-element rel-position clickible n-font savee" type="button" @click="Save(0)">Yes, I want to help misty!</button>
            <a class="main-element rel-position clickible n-font savee" href="https://gofund.me/6d89967b" @click.prevent="Save(1)">I'm sorry, I'm not able to help right now.</a>
        </div>
    </div>
</template>

<script setup lang="ts">
    function Save(mode: number) {
        localStorage.setItem('misty', 'true');
        if (mode === 0) {
            window.location.replace('https://gofund.me/6d89967b');
        } else {
            window.location.reload()
        }
    };
</script>

<style scoped>
    #blurr {
        position: fixed;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
        background-color: rgba(255, 255, 255, 0.25);
        display: flex;
        justify-content: center;
        align-items: center;
        z-index: 2;
    }

    #savemisty {
        width: 35%;
        display: flex;
        justify-content: center;
        flex-direction: column;
    }

    .savee {
        width: 100%;
        margin-bottom: 5%;
    }
</style>