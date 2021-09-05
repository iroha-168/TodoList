<template>
  <div>
    <div class="input_todo">
      <v-form>
        <v-container>
          <v-row>
            <v-col md="7">
            <h2>TODOリスト</h2>
              <v-text-field
                v-model="todo"
                label="Todo"
                type=text
                required>
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
        <li v-for="(val, index) in todos" :key="index">{{ val.content }} 
          <span>✖️</span>
        </li>
      </ul>
    </div>

  </div>
</template>



<script>
import { ref } from '@nuxtjs/composition-api'

export default {
  setup() {
    // TextFieldに入力された文字列を取得する
    const id = ref(1)
    const todo = ref('')
    const todos = ref([])

    const addTodo = () => {
      todos.value.push({id: id.value, content: todo.value})
      id.value++
      todo.value = ''
    }

    return {
      addTodo,
      todos,
      todo
    }
  }
}
</script>
