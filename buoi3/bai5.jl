mutable struct TextEditor
    text::String
    undo_stack::Vector{String}
    redo_stack::Vector{String}

    function TextEditor()
        new("", String[], String[])
    end
end

function type_text!(editor::TextEditor, new_text::String)
    push!(editor.undo_stack, editor.text)
    editor.text *= new_text
    empty!(editor.redo_stack)
    println("Text after typing: ", editor.text)
    display_all(editor)
end

function undo!(editor::TextEditor)
    if !isempty(editor.undo_stack)
        push!(editor.redo_stack, editor.text)
        editor.text = pop!(editor.undo_stack)
        println("Text after undo: ", editor.text)
        display_all(editor)
    else
        println("Nothing to undo")
    end
end

function redo!(editor::TextEditor)
    if !isempty(editor.redo_stack)
        push!(editor.undo_stack, editor.text)
        editor.text = pop!(editor.redo_stack)
        println("Redo: ", editor.text)
        display_all(editor)
    else
        println("Nothing to redo")
    end
end

function display_all(editor::TextEditor)
    println("display all: ", editor.text, "\n")
end

# simulate
function main()
    editor = TextEditor()
    type_text!(editor, "Hello, ")
    type_text!(editor, "world!")
    undo!(editor)
    undo!(editor)
    redo!(editor)
    redo!(editor)
    redo!(editor)
end

main()