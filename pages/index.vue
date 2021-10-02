<template>
  <div>
    <div class="input_todo">
      <v-form onsubmit="return false;">
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

    <div class="todo_list">
      <ul type="cirsle">
        <v-card 
          v-for="todo in todos" :key="todo.id"
          max-width="400">
          {{ todo.content }} 

          <v-btn icon color="blue" @click='deleteTodo(todo.id)'>
            <v-icon>mdi-delete</v-icon>
          </v-btn>

          <v-btn icon color="blue" @click='returnToForm(todo.id)'>
            <v-icon>mdi-pencil-outline</v-icon>
          </v-btn>
        </v-card>
      </ul>
    </div>

  </div>
</template>



<script>
import { ref } from '@nuxtjs/composition-api'

export default {
  setup() {
    // TextFieldに入力された文字列を取得する
    const id = ref(0)
    const content = ref('') // 入力フォームに入力された文字が入る
    const todos = ref([])
    const targetEditId = ref(null)

    const addTodo = () => {
      todos.value.push({id: id.value, content: content.value})
      id.value++
      content.value = ''
    }

    const deleteTodo = (targetId) => {
      todos.value = todos.value.filter(todo => todo.id !== targetId)
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

    // エンターキー押下でtodosを編集する
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
      addTodo,
      todos,
      content,
      deleteTodo,
      returnToForm,
      editTodo
    }
  }
}
</script>
