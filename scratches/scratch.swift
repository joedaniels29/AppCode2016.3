class TodosController: ApplicationController {
    // shared todo variable used to pass value between setTodo filter and actions
    var todo: Todo?
    override func controller() {

        // sets before filter setTodo only for specified actions.
        beforeAction("setTodo", only: ["show", "edit", "update", "destroy"])

        // render all Todo instances with Index template (in Views/Todos/Index.html.stencil)
        action("index") { request in
            let todos = ["todos": Todo.allAttributes()]
            return render("Todos/Index", todos)
        }

        index { request in
            let todos = ["todos": Todo.allAttributes()]
            return render("Todos/Index", todos)
        }

        // render Todo instance that was set in before filter
        action("show") { request in
            return render("Todos/Show", self.todo)
        }

        // render static New template
        action("new") { request in
            return render("Todos/New")
        }

        // render Todo instance's edit form
        action("edit") { request in
            return render("Todos/Edit", self.todo)
        }

        // create new Todo instance and redirect to list of Todos
        action("create") { request in
            Todo.create(request.params)
            return redirectTo("/todos")
        }

        // update Todo instance and redirect to updated Todo instance
        action("update") { request in
            self.todo!.update(request.params)
            return redirectTo("/todos/\(self.todo!.id)")
        }

        // destroy Todo instance
        action("destroy") { request in
            Todo.destroy(self.todo)
            return redirectTo("/todos")
        }

        // set todo shared variable to actions can use it
        filter("setTodo") { request in
            // Redirect to "/todos" list if Todo instance is not found
            guard let t = Todo.find(request.params["id"]) else { return self.redirectTo("/todos") }
            self.todo = t as? Todo
            // Run next filter or action
            return self.next
        }

        def index
        action("index") { request in
            let todos = ["todos": Todo.allAttributes()]
            return render("Todos/Index", todos)
        }


    }
    func index (handle:(Request)->(resp) ) {
        actions["index"] = body
    }
}


}