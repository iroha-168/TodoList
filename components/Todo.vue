<template>
    <div class="input_todo">
            <v-form @submit.prevent>
                <v-container>
                <v-row>
                    <v-col md="7">
                    <h2>TODOリスト</h2>
                    <v-text-field
                        v-model="content"
                        label="Todo"
                        type=text
                        required
                        @keydown.enter.exact.prevent
                        @keyup.enter.exact="editTodo"
                    >
                    </v-text-field>
                    <v-row justify="end">
                        <v-btn color="primary" @click="addTodo">追加</v-btn>
                    </v-row>
                    </v-col>
                </v-row>  
                </v-container>
            </v-form>
        </div>
</template>

<script>
import { defineComponent } from '@vue/composition-api'
import { ref } from '@nuxtjs/composition-api'

export default defineComponent({
    name: 'Todo',
    setup() {
        const content = ref('')
        const todos = ref([])
        const id = ref(0)
        const targetEditId = ref(null)

        const addTodo = () => {
            todos.value.push({id: id.value, content: content.value})
            id.value++
            content.value = ''
        }

        const editTodo = () => {
            todos.value.map((todo) => {
                if(todo.id === targetEditId.value) {
                    todo.content = content.value
                    content.value = ""
                }
                return todos
            })
        }

        return {
            content,
            addTodo,
            editTodo
        }
    },
})
</script>
