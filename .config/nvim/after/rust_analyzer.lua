return {
    settings = {
        ["rust-analyzer"] = {
            check = {
                command = "clippy",
                extraArgs = {
                    "--workspace",
                    "--all-targets",
                    "--",
                    "-Dwarnings",
                },
            },
        },
    },
}
