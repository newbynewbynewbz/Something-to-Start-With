#!/bin/bash
# setup-token.sh - Helper script to set up MCP authentication tokens
# Usage: ./setup-token.sh

echo "=================================="
echo "  MCP Token Setup Helper"
echo "=================================="
echo ""

# Detect shell config file
if [ -n "$ZSH_VERSION" ] || [ -f "$HOME/.zshrc" ]; then
    SHELL_CONFIG="$HOME/.zshrc"
else
    SHELL_CONFIG="$HOME/.bashrc"
fi

echo "Shell config file: $SHELL_CONFIG"
echo ""

# GitHub Token Setup
echo "--- GitHub Personal Access Token ---"
echo ""
echo "To create a token:"
echo "1. Go to: https://github.com/settings/tokens"
echo "2. Click 'Generate new token (classic)'"
echo "3. Select scopes: repo, read:org"
echo "4. Copy the generated token"
echo ""

read -p "Do you want to set up GitHub token now? (y/n): " setup_github

if [ "$setup_github" = "y" ] || [ "$setup_github" = "Y" ]; then
    read -sp "Enter your GitHub Personal Access Token: " github_token
    echo ""

    if [ -n "$github_token" ]; then
        echo "" >> "$SHELL_CONFIG"
        echo "# GitHub MCP Server" >> "$SHELL_CONFIG"
        echo "export GITHUB_PERSONAL_ACCESS_TOKEN=\"$github_token\"" >> "$SHELL_CONFIG"
        echo "GitHub token added to $SHELL_CONFIG"
    fi
fi

echo ""

# Brave Search Token Setup
echo "--- Brave Search API Key ---"
echo ""
echo "To get an API key:"
echo "1. Go to: https://brave.com/search/api/"
echo "2. Sign up for an account"
echo "3. Copy your API key"
echo ""

read -p "Do you want to set up Brave Search API key now? (y/n): " setup_brave

if [ "$setup_brave" = "y" ] || [ "$setup_brave" = "Y" ]; then
    read -sp "Enter your Brave Search API Key: " brave_key
    echo ""

    if [ -n "$brave_key" ]; then
        echo "" >> "$SHELL_CONFIG"
        echo "# Brave Search MCP Server" >> "$SHELL_CONFIG"
        echo "export BRAVE_API_KEY=\"$brave_key\"" >> "$SHELL_CONFIG"
        echo "Brave API key added to $SHELL_CONFIG"
    fi
fi

echo ""
echo "=================================="
echo "  Setup Complete!"
echo "=================================="
echo ""
echo "To apply changes, run:"
echo "  source $SHELL_CONFIG"
echo ""
echo "Or open a new terminal window."
echo ""
echo "To verify your tokens are set:"
echo "  echo \$GITHUB_PERSONAL_ACCESS_TOKEN"
echo "  echo \$BRAVE_API_KEY"
