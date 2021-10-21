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
    name: 'Form',
    props: {
        id: {
            type: Number,
            required: false,
            default: 0
        },
        pcontent: {
            type: String,
            required: false,
            default: ''
        }
    },
    setup(props, context) {
        const content = ref('')
        const todos = ref([])
        const id = ref(0)
        const targetEditId = ref(null)

        content.value = props.pcontent

        const addTodo = () => {
            id.value++
            context.emit('add', {id: id.value, content: content.value})
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
