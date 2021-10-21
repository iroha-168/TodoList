<template>
    <div>
        <!-- イベントの中のaddイベントをとる -->
        <Form :id='id' :pcontent='content' @add='showTodo'/> 
        <div class="todo_list">
            <ul>
                <li v-for="todo in todos" :key="todo.id">
                    <v-card max-width="400">
                    {{ todo.content }} 

                        <v-btn icon color="blue" @click='deleteTodo(todo.id)'>
                            <v-icon>mdi-delete</v-icon>
                        </v-btn>

                        <v-btn icon color="blue" @click='returnToForm(todo.id)'>
                            <v-icon>mdi-pencil-outline</v-icon>
                        </v-btn>
                    </v-card>
                </li>
            </ul>
        </div>
    </div>
</template>



<script>
import { ref } from '@nuxtjs/composition-api'
import Form from '~/components/Form'

export default {
    name: 'Sample',
    components: {
        Form
    },
    setup() {
        // TextFieldに入力された文字列を取得する
        const id = ref(0)
        const content = ref('') // 入力フォームに入力された文字が入る
        const todos = ref([])
        const targetEditId = ref(null)

        const showTodo = (todo) => {
            todos.value.push(todo)
            content.value = ''
        }

        // 選択されたtodoを入力フォームに表示させる
        const returnToForm = (targetId) => {
            targetEditId.value = targetId

            todos.value.forEach((todo) => {
                if(todo.id === targetId) {
                    content.value = todo.content
                }
            })
        }

        const deleteTodo = (targetId) => {
            todos.value = todos.value.filter(todo => todo.id !== targetId)
        }

        return {
            todos,
            content,
            returnToForm,
            deleteTodo,
            id,
            showTodo
        }
    }
}
</script>
