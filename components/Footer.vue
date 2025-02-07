<template>
    <div class="main-element" id="footer">
        <div class="accent rel-position footer-segment">
            <a class="main-element n-font clickible footer-element" href="https://github.com/Eli-Sterken">My GitHub Page</a>
            <a class="main-element n-font clickible footer-element" href="https://github.com/Eli-Sterken/Item-Indexer">Project Repo</a>
            <a class="main-element n-font clickible footer-element" href="/">Site Link (Share With Friends!)</a>
            <a class="main-element n-font clickible footer-element" href="https://www.youtube.com/watch?v=E4WlUXrJgy4">Very Importent Must Click</a>
            <button class="main-element n-font clickible footer-element rel-position accent" type="button" id="mode-btn" @click="$emit('ChangeMode')">
                <img id="mode-img" :src="src">
            </button>
        </div>

        <div class="accent rel-position footer-segment">
            <p class="main-element n-font footer-element">Quick Tips:<br><br>Press Ctrl(or Cmd) + Alt + L for light mode, and Ctrl(or Cmd) + Alt + D for dark mode.<br><br>You can also press Ctrl(or Cmd) + Alt + F to toggle fullscreen!<br><br>Please note that all items are saved in your browser. This means they will be cleared if you clear your browser cookies/data</p>
            <p class="main-element n-font footer-element">Made with love by Eli Steken :)</p>
        </div>
    </div>
</template>

<script setup lang="ts">
    defineProps({
        src: {type: String, required: true}
    });
    defineEmits([
       'ChangeMode' 
    ]);
</script>

<style scoped>
    .footer-segment {
        width: 25%;
        height: 35;
        border-radius: 10px;
        margin-right: 10%;
        margin-left: 10%;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }

    .footer-element {
        width: 90%;
        margin-left: 5%;
        margin-right: 5%;
        height: fit-content;
        margin-top: 5%;
        margin-bottom: 5%;
    }

    #footer {
        width: 100%;
        height: fit-content;
        display: flex;
        flex-direction: row;
        justify-content: center;
    }

    #mode-btn {
        width: 20%;
        height: 8vh;
    }

    #mode-img {
        position: absolute;
        border-radius: 5px;
        top: 0%;
        left: 0%;
        width: 100%;
        height: 100%;
    }
</style>