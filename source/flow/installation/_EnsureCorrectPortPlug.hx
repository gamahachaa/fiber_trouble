package flow.installation;

import process.Action;

class _EnsureCorrectPortPlug extends Action {
    override public function create():Void
        {
            this._nextProcesses = [new IsOTOidAligned()];
            super.create();
        }
}