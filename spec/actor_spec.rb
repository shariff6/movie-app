require("spec_helper")

  describe(Actor) do

    describe("#initialize") do
      it("is initialized with a name") do
        actor = Actor.new({:name => "Brad Pitt", :id => nil})
        expect(actor).to(be_an_instance_of(Actor))
      end

      it("can be initialized with its database ID") do
        actor = Actor.new({:name => "Brad Pitt", :id => 1})
        expect(actor).to(be_an_instance_of(Actor))
      end
    end

    describe(".all") do
      it("starts off with no movies") do
        expect(Actor.all()).to(eq([]))
      end
    end

    describe(".find") do
      it("returns a actor by its ID number") do
        test_actor = Actor.new({:name => "Brad Pitt", :id => nil})
        test_actor.save()
        test_actor2 = Actor.new({:name => "George Clooney", :id => nil})
        test_actor2.save()
        expect(Actor.find(test_actor2.id())).to(eq(test_actor2))
      end
    end

    describe("#==") do
      it("is the same actor if it has the same name and id") do
        actor = Actor.new({:name => "Brad Pitt", :id => nil})
        actor2 = Actor.new({:name => "Brad Pitt", :id => nil})
        expect(actor).to(eq(actor2))
      end
    end

    describe("#update") do
      it("lets you update actors in the database") do
        actor = Actor.new({:name => "George Clooney", :id => nil})
        actor.save()
        actor.update({:name => "Brad Pitt"})
        expect(actor.name()).to(eq("Brad Pitt"))
      end
    end

    describe("#delete") do
      it("lets you delete an actor from the database") do
        actor = Actor.new({:name => "George Clooney", :id => nil})
        actor.save()
        actor2 = Actor.new({:name => "Brad Pitt", :id => nil})
        actor2.save()
        actor.delete()
        expect(Actor.all()).to(eq([actor2]))
      end
    end
  end
